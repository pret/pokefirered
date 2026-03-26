#!/usr/bin/env pwsh
[CmdletBinding()]
param(
    [ValidateSet("modern", "rom", "firered", "firered_rev1", "leafgreen", "leafgreen_rev1", "fullspec", "fullspec_modern")]
    [string]$Target = "fullspec_modern",

    [int]$Jobs = [Math]::Max(1, [Environment]::ProcessorCount)
)

$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Push-Location $repoRoot

try {
    Write-Host "[1/5] Repository root: $repoRoot"

    if (-not (Get-Command make -ErrorAction SilentlyContinue)) {
        throw "'make' was not found in PATH. Install required build tools first (see INSTALL.md)."
    }

    Write-Host "[2/5] Cleaning build outputs..."
    & make clean
    if ($LASTEXITCODE -ne 0) {
        throw "make clean failed with exit code $LASTEXITCODE"
    }

    Write-Host "[3/5] Rebuilding required tools..."
    & make tools
    if ($LASTEXITCODE -ne 0) {
        throw "make tools failed with exit code $LASTEXITCODE"
    }

    Write-Host "[4/5] Regenerating derived sources/assets..."
    & make generated
    if ($LASTEXITCODE -ne 0) {
        throw "make generated failed with exit code $LASTEXITCODE"
    }

    Write-Host "[5/5] Building target '$Target' with -j$Jobs..."
    $buildOutput = & make $Target "-j$Jobs" 2>&1
    $buildExit = $LASTEXITCODE

    # Display build output
    $buildOutput | ForEach-Object { Write-Host $_ }

    if ($buildExit -ne 0) {
        throw "make $Target failed with exit code $buildExit"
    }

    # --- Build Report ---
    Write-Host ""
    Write-Host "========== BUILD REPORT ==========" -ForegroundColor Cyan

    # Memory usage from linker output
    $memLines = $buildOutput | Where-Object { $_ -match '^\s+(EWRAM|IWRAM|ROM):' }
    if ($memLines) {
        Write-Host "Memory Usage:" -ForegroundColor Yellow
        foreach ($line in $memLines) {
            $color = "Green"
            if ($line -match '(\d+\.\d+)%') {
                $pct = [double]$Matches[1]
                if ($pct -ge 95) { $color = "Red" }
                elseif ($pct -ge 85) { $color = "Yellow" }
            }
            Write-Host "  $($line)" -ForegroundColor $color
        }
    }

    # Warnings (excluding known newlib ones)
    $warnings = $buildOutput | Where-Object {
        $_ -match 'warning:' -and $_ -notmatch 'is not implemented and will always fail' -and $_ -notmatch 'has a LOAD segment with RWX'
    }
    if ($warnings) {
        Write-Host "Warnings ($($warnings.Count)):" -ForegroundColor Yellow
        foreach ($w in $warnings | Select-Object -First 10) {
            Write-Host "  $($w)" -ForegroundColor Yellow
        }
        if ($warnings.Count -gt 10) {
            Write-Host "  ... and $($warnings.Count - 10) more" -ForegroundColor Yellow
        }
    } else {
        Write-Host "Warnings: 0" -ForegroundColor Green
    }

    # ROM file info — derive name from build output directory
    $romName = switch ($Target) {
        "modern"           { "pokefullspec_modern.gba" }
        "rom"              { "pokefullspec.gba" }
        "fullspec"         { "pokefullspec.gba" }
        "fullspec_modern"  { "pokefullspec_modern.gba" }
        "firered"          { "pokefirered.gba" }
        "firered_rev1"     { "pokefirered_rev1.gba" }
        "leafgreen"        { "pokeleafgreen.gba" }
        "leafgreen_rev1"   { "pokeleafgreen_rev1.gba" }
        default            { "pokefullspec_modern.gba" }
    }
    $romPath = Join-Path $repoRoot $romName
    if (Test-Path $romPath) {
        $romSize = (Get-Item $romPath).Length
        $romKB = [math]::Round($romSize / 1024)
        Write-Host "ROM: $romName ($romKB KB)" -ForegroundColor Green
    }

    Write-Host "==================================" -ForegroundColor Cyan
    Write-Host "Build complete." -ForegroundColor Green
}
finally {
    Pop-Location
}
