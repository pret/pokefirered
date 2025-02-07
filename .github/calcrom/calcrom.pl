#!/usr/bin/perl

# Usage:
#   calcrom.pl <mapfile> [--verbose][--data]
#
#   mapfile: path to .map file output by LD
#   verbose: set to get more detailed output
#   data: set to output % breakdown of data

use IPC::Cmd qw[ run ];
use Getopt::Long;

my $usage = "Usage: calcrom.pl file.map [--verbose][--data]\n";
my $verbose = "";
my $showData;

GetOptions("verbose" => \$verbose, "data" => \$showData) or die $usage;
(@ARGV == 1)
    or die $usage;
open(my $file, $ARGV[0])
    or die "ERROR: could not open file '$ARGV[0]'.\n";

my $src = 0;
my $asm = 0;
my $srcdata = 0;
my $data = 0;
my @pairs = ();
while (my $line = <$file>)
{
    if ($line =~ /^ \.(\w+)\s+0x[0-9a-f]+\s+(0x[0-9a-f]+) (\w+)\/(.+)\.o/)
    {
        my $section = $1;
        my $size = hex($2);
        my $dir = $3;
        my $basename = $4;
        if ($size & 3)
        {
            $size += 4 - ($size % 3);
        }

        if ($section =~ /text/)
        {
            if ($dir eq 'src')
            {
                $src += $size;
            }
            elsif ($dir eq 'asm')
            {
                if (!($basename =~ /(crt0|libagbsyscall|libgcnmultiboot|m4a_1)/))
                {
                    push @pairs, [$basename, $size];
                }
                $asm += $size;
            }
        }
        elsif ($section =~ /rodata/)
        {
            if ($dir eq 'src')
            {
                $srcdata += $size;
            }
            elsif ($dir eq 'data')
            {
                $data += $size;
            }
        }
    }
}

my @sorted = sort { $a->[1] <=> $b->[1] } @pairs;
(my $elffname = $ARGV[0]) =~ s/\.map/.elf/;

# Note that the grep filters out all branch labels. It also requires a minimum
# line length of 5, to filter out a ton of generated symbols (like AcCn). No
# settings to nm seem to remove these symbols. Finally, nm prints out a separate
# entry for whenever a name appears in a file, not just where it's defined. uniq
# removes all the duplicate entries.
#
#
# You'd expect this to take a while, because of uniq. It runs in under a second,
# though. Uniq is pretty fast!
my $base_cmd = "nm $elffname | awk '{print \$3}' | grep '^[^_].\\{4\\}' | uniq";

# This looks for Unknown_, Unknown_, or sub_, followed by an address. Note that
# it matches even if stuff precedes the unknown, like sUnknown/gUnknown.
my $undoc_regex = "'[Uu]nknown_[0-9a-fA-F]\\{5,7\\}\\|sub_[0-9a-fA-F]\\{5,7\\}'";

# This looks for every symbol with an address at the end of it. Some things are
# given a name based on their type / location, but still have an unknown purpose.
# For example, FooMap_EventScript_FFFFFFF.
# The above may be double counted here, and will need to be filtered out.
my $partial_doc_regex = "'_[0-28][0-9a-fA-F]\\{5,7\\}'";

my $count_cmd = "wc -l";

# It sucks that we have to run this three times, but I can't figure out how to get
# stdin working for subcommands in perl while still having a timeout. It's decently
# fast anyway.
my $total_syms_as_string;
(run (
    command => "$base_cmd | $count_cmd",
    buffer => \$total_syms_as_string,
    timeout => 60
))
    or die "ERROR: Error while getting all symbols: $?";

my $undocumented_as_string;
(run (
    command => "$base_cmd | grep $undoc_regex | $count_cmd",
    buffer => \$undocumented_as_string,
    timeout => 60
))
    or die "ERROR: Error while filtering for undocumented symbols: $?";

my $partial_documented_as_string;
(run (
    command => "$base_cmd | grep $partial_doc_regex | grep -v $undoc_regex | $count_cmd",
    buffer => \$partial_documented_as_string,
    timeout => 60
))
    or die "ERROR: Error while filtering for partial symbols: $?";

# Performing addition on a string converts it to a number. Any string that fails
# to convert to a number becomes 0. So if our converted number is 0, but our string
# is nonzero, then the conversion was an error.
$undocumented_as_string =~ s/^\s+|\s+$//g;
my $undocumented = $undocumented_as_string + 0;
(($undocumented != 0) or (($undocumented == 0) and ($undocumented_as_string eq "0")))
    or die "ERROR: Cannot convert string to num: '$undocumented_as_string'";

$partial_documented_as_string =~ s/^\s+|\s+$//g;
my $partial_documented = $partial_documented_as_string + 0;
(($partial_documented != 0) or (($partial_documented == 0) and ($partial_documented_as_string eq "0")))
    or die "ERROR: Cannot convert string to num: '$partial_documented_as_string'";

$total_syms_as_string =~ s/^\s+|\s+$//g;
my $total_syms = $total_syms_as_string + 0;
(($total_syms != 0) or (($total_syms == 0) and ($total_syms_as_string eq "0")))
    or die "ERROR: Cannot convert string to num: '$total_syms_as_string'";

($total_syms != 0)
    or die "ERROR: No symbols found.";

my $total = $src + $asm;
my $srcPct = sprintf("%.4f", 100 * $src / $total);
my $asmPct = sprintf("%.4f", 100 * $asm / $total);

my $documented = $total_syms - ($undocumented + $partial_documented);
my $docPct = sprintf("%.4f", 100 * $documented / $total_syms);
my $partialPct = sprintf("%.4f", 100 * $partial_documented / $total_syms);
my $undocPct = sprintf("%.4f", 100 * $undocumented / $total_syms);

if ($asm == 0)
{
    print "Code decompilation is 100% complete\n"
}
else
{
    print "$total total bytes of code\n";
    print "$src bytes of code in src ($srcPct%)\n";
    print "$asm bytes of code in asm ($asmPct%)\n";
}
print "\n";

if ($verbose != 0)
{
    print "BREAKDOWN\n";
    foreach my $item (@sorted)
    {
        print "    $item->[1] bytes in asm/$item->[0].s\n"
    }
    print "\n";
}

if ($partial_documented == 0 && $undocumented == 0)
{
    print "Documentation is 100% complete\n"
}
else
{
    print "$total_syms total symbols\n";
    print "$documented symbols documented ($docPct%)\n";
    print "$partial_documented symbols partially documented ($partialPct%)\n";
    print "$undocumented symbols undocumented ($undocPct%)\n";
}

if ($showData)
{
    print "\n";

    my $dataTotal = $srcdata + $data;
    my $srcDataPct = sprintf("%.4f", 100 * $srcdata / $dataTotal);
    my $dataPct = sprintf("%.4f", 100 * $data / $dataTotal);
    print "$dataTotal total bytes of data\n";
    print "$srcdata bytes of data in src ($srcDataPct%)\n";
    print "$data bytes of data in data ($dataPct%)\n";
}
