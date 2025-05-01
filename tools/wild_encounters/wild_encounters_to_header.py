import json
import re
import os


IS_ENABLED            = False

# C string vars
define                = "#define"
ENCOUNTER_CHANCE      = "ENCOUNTER_CHANCE"
SLOT                  = "SLOT"
TOTAL                 = "TOTAL"
NULL                  = "NULL"
UNDEFINED             = "UNDEFINED"
MAP_UNDEFINED         = "MAP_UNDEFINED"

# encounter group header types, filled out programmatically
MON_HEADERS = []

# mon encounter group types
fieldData = []
fieldInfoStrings = []
fieldStrings = []

# time of day encounter data
TIME_DEFAULT       = ""
TIME_DEFAULT_LABEL = "TIME_OF_DAY_DEFAULT"
TIME_DEFAULT_INDEX = 0
TIMES_OF_DAY_COUNT = TIME_DEFAULT_INDEX + 1

# struct building blocks
baseStruct          = "const struct WildPokemon"
structLabel         = ""
structMonType       = ""
structTime          = ""
structMap           = ""

structInfo          = "Info"
structHeader        = "Header"
structArrayAssign   = "[] ="

baseStructLabel     = ""
baseStructContent   = []
infoStructString    = ""
infoStructRate      = 0
infoStructContent   = []
headerStructLabel   = ""
headerStructContent = {}
headerStructTable   = {}
headerIndex = 0

# map header data variables
hLabel       = ""
hForMaps     = True
headersArray = [headerIndex]



# debug output control
mainSwitch                      = True
printWarningAndInclude          = mainSwitch
printEncounterHeaders           = mainSwitch
printEncounterRateMacros        = mainSwitch
printEncounterStructsInfoString = mainSwitch
printEncounterStructs           = mainSwitch


class TimeOfDay():
    def __init__(self):
        self.vals = []
        self.lvals = []
        self.fvals = []
        self.count = 0

    def __len__(self):
        return self.count
    
    # for debugging purposes
    def __str__(self):
        return str([self.vals, self.lvals, self.fvals, self.count])

    def add(self, val):
        self.vals.append(val)
        self.lvals.append(val.lower())
        self.fvals.append(GetTimeLabelFromString(val).capitalize())
        self.count += 1
    
    def indexOf(self, val):
        tempArr = [self.vals, self.lvals, self.fvals]

        for tvals in tempArr:
            i = 0
            for time in tvals:
                if val in time:
                    return i

                i += 1
        # return -1 here so it returns a consistent type and can be checked against < 0
        return -1


def ImportWildEncounterFile():
    # make sure we're in the right directory before anything else
    if not os.path.exists("Makefile"):
        print("Please run this script from the project's root folder.")
        quit()

    global MON_HEADERS

    global TIME_OF_DAY
    TIME_OF_DAY = SetupUserTimeEnum(TimeOfDay())

    global IS_ENABLED
    global TIMES_OF_DAY_COUNT
    if IsConfigEnabled():
        IS_ENABLED = True
        TIMES_OF_DAY_COUNT = len(TIME_OF_DAY)

    global fieldInfoStrings
    global fieldStrings
    global structLabel
    global structMonType
    global structTime
    global structMap
    global baseStructLabel
    global baseStructContent
    global infoStructString
    global infoStructRate
    global headerStructLabel
    global headerStructContent
    global hLabel
    global headersArray
    global encounterTotalCount
    global encounterCount
    global headerIndex
    global fieldData
    global tabStr
    tabStr = "    "

    wFile = open("src/data/wild_encounters.json")
    wData = json.load(wFile)

    encounterTotalCount = []
    encounterCount = []
    groupCount = 0
    while groupCount < len(wData["wild_encounter_groups"]):
        encounterTotalCount.append(0)
        encounterCount.append(0)
        groupCount += 1

    for data in wData["wild_encounter_groups"]:
        wEncounters = wData["wild_encounter_groups"][headerIndex]["encounters"]
        headerSuffix = structHeader + "s"

        if data["label"]:
            hLabel = wData["wild_encounter_groups"][headerIndex]["label"]
            if headerSuffix in hLabel:
                hLabel = hLabel[:len(hLabel) - len(headerSuffix)]
            MON_HEADERS.append(hLabel)

        if data["for_maps"]:
            hForMaps = wData["wild_encounter_groups"][headerIndex]["for_maps"]
    
        # for the encounter rate macros, so we don't worry about hidden mons here
        if headerIndex == 0:
            wFields = wData["wild_encounter_groups"][headerIndex]["fields"]
            fieldCounter = 0
            for field in wFields:
                fieldData.append({})
                fieldData[fieldCounter]["name"] = field["type"]
                fieldData[fieldCounter]["pascalName"] = GetPascalCase(field["type"])
                fieldData[fieldCounter]["snakeName"] = GetSnakeCase(field["type"])
                fieldData[fieldCounter]["encounter_rates"] = field["encounter_rates"]

                if "groups" in field:
                    fieldData[fieldCounter]["groups"] = field["groups"]

                if fieldCounter == len(wFields) - 1:
                    fieldData.append({})
                    fieldData[fieldCounter + 1]["name"] = "hidden_mons"
                    fieldData[fieldCounter + 1]["pascalName"] = GetPascalCase("hidden_mons")
                    fieldData[fieldCounter + 1]["snakeName"] = GetSnakeCase("hidden_mons")

                fieldCounter += 1

            if printWarningAndInclude:
                PrintGeneratedWarningText()
                print('#include "rtc.h"')
                print("\n")

            PrintEncounterRateMacros()

        for encounter in wEncounters:
            if "map" in encounter:
                structMap = encounter["map"]
            else:
                structMap = encounter["base_label"]

            structLabel = encounter["base_label"]

            if encounterTotalCount[headerIndex] != len(wEncounters):
                encounterTotalCount[headerIndex] = len(wEncounters)

            encounterCount[headerIndex] += 1
            headersArray = []
            
            structTime = TIME_DEFAULT_INDEX
            if IS_ENABLED:
                timeCounter = 0
                while timeCounter < TIMES_OF_DAY_COUNT:
                    tempfTime = f"_{TIME_OF_DAY.fvals[timeCounter]}"
                    tempTime = TIME_OF_DAY.vals[timeCounter]
                    if tempfTime in structLabel or tempTime in structLabel:
                        structTime = timeCounter

                    timeCounter += 1
                    
            fieldCounter = 0
            fieldInfoStrings = []
            while fieldCounter < len(fieldData):
                fieldInfoStrings.append("")
                fieldStrings.append("")
                fieldCounter += 1

            fieldCounter = 0
            while fieldCounter < len(fieldData):
                for areaTable in encounter:
                    if fieldData[fieldCounter]["name"] in areaTable:
                        structMonType = fieldData[fieldCounter]["pascalName"]
                        if f"_{TIME_OF_DAY.fvals[structTime]}" in structLabel:
                            fieldInfoStrings[fieldCounter] = f"{structLabel}_{structMonType}{structInfo}"
                            fieldStrings[fieldCounter] = f"{structLabel}_{structMonType}"
                        else:
                            fieldInfoStrings[fieldCounter] = f"{structLabel}_{TIME_OF_DAY.fvals[structTime]}_{structMonType}{structInfo}"
                            fieldStrings[fieldCounter] = f"{structLabel}_{TIME_OF_DAY.fvals[structTime]}_{structMonType}"
                    else:
                        structMonType = ""
                        continue
                
                    baseStructContent = []
                    for group in encounter[areaTable]:
                        if "mons" in group:
                            for mon in encounter[areaTable][group]:
                                baseStructContent.append(list(mon.values()))

                        if "encounter_rate" in group:
                            infoStructRate = encounter[areaTable][group]
                    
                    baseStructLabel = f"{baseStruct} {fieldStrings[fieldCounter]}{structArrayAssign}"
                    if printEncounterStructs:
                        print()
                        print(baseStructLabel)
                        print("{")
                        PrintStructContent(baseStructContent)
                        print("};")

                    if printEncounterStructsInfoString:
                        infoStructString = f"{baseStruct}{structInfo} {fieldInfoStrings[fieldCounter]} = {{ {infoStructRate}, {fieldStrings[fieldCounter]} }};"
                        print(infoStructString)

                fieldCounter += 1
            AssembleMonHeaderContent()
        headerIndex += 1
    PrintWildMonHeadersContent()


def PrintStructContent(contentList):
    for monList in contentList:
        print(f"{tabStr}{{ {monList[0]}, {monList[1]}, {monList[2]} }},")
    return


def GetStructLabelWithoutTime(label):
    labelLength = len(label)
    timeLength = 0

    if not IS_ENABLED:
        return label
    
    timeCounter = 0
    while timeCounter < TIMES_OF_DAY_COUNT:
        tempTime = TIME_OF_DAY.fvals[timeCounter]
        if tempTime in label:
            timeLength = len(tempTime)
            return label[:(labelLength - (timeLength + 1))]

        timeCounter += 1
    return label


def GetStructTimeWithoutLabel(label):
    if not IS_ENABLED:
        return TIME_DEFAULT_INDEX
    
    timeCounter = 0
    while timeCounter < TIMES_OF_DAY_COUNT:
        tempTime = f"_{TIME_OF_DAY.fvals[timeCounter]}"
        if tempTime in label:
            return timeCounter

        timeCounter += 1
    return TIME_DEFAULT_INDEX


def AssembleMonHeaderContent():
    SetupMonInfoVars()

    tempHeaderLabel = GetWildMonHeadersLabel()
    tempHeaderTimeIndex = GetStructTimeWithoutLabel(structLabel)
    structLabelNoTime = GetStructLabelWithoutTime(structLabel)
    
    if tempHeaderLabel not in headerStructTable:
        headerStructTable[tempHeaderLabel] = {}
        headerStructTable[tempHeaderLabel]["groupNum"] = headerIndex

    if structLabelNoTime not in headerStructTable[tempHeaderLabel]:
        headerStructTable[tempHeaderLabel][structLabelNoTime] = {}
        headerStructTable[tempHeaderLabel][structLabelNoTime]["headerType"] = GetWildMonHeadersLabel()
        headerStructTable[tempHeaderLabel][structLabelNoTime]["mapGroup"] = structMap
        headerStructTable[tempHeaderLabel][structLabelNoTime]["mapNum"] = structMap
        headerStructTable[tempHeaderLabel][structLabelNoTime]["encounterTotalCount"] = encounterTotalCount[headerIndex]
        headerStructTable[tempHeaderLabel][structLabelNoTime]["encounter_types"] = []

        timeCounter = 0
        while timeCounter < TIMES_OF_DAY_COUNT:
            headerStructTable[tempHeaderLabel][structLabelNoTime]["encounter_types"].append([])
            timeCounter += 1

    fieldCounter = 0
    while fieldCounter < len(fieldData):
        headerStructTable[tempHeaderLabel][structLabelNoTime]["encounter_types"][tempHeaderTimeIndex].append(fieldInfoStrings[fieldCounter])
        fieldCounter += 1


def SetupMonInfoVars():
    i = 0
    while i < len(fieldData):
        fieldData[i]["infoStringBase"] = "." + fieldData[i]["snakeName"] + structInfo
        if CheckEmpty(fieldInfoStrings[i]):
            fieldInfoStrings[i] = NULL
        else:
            fieldInfoStrings[i] = "&" + fieldInfoStrings[i]

        i += 1


def PrintWildMonHeadersContent():
    groupCount = 0
    for group in headerStructTable:
        labelCount = 0
        for label in headerStructTable[group]:
            if label != "groupNum":
                if labelCount == 0:
                    PrintEncounterHeaders("\n")
                    PrintEncounterHeaders(headerStructTable[group][label]["headerType"])

                PrintEncounterHeaders(tabStr + "{")

                for stat in headerStructTable[group][label]:
                    mapData = headerStructTable[group][label][stat]

                    if stat == "mapGroup":
                        PrintEncounterHeaders(f"{TabStr(2)}.mapGroup = {GetMapGroupEnum(mapData)},")
                    elif stat == "mapNum":
                        PrintEncounterHeaders(f"{TabStr(2)}.mapNum = {GetMapGroupEnum(mapData, labelCount + 1)},")

                    if type(headerStructTable[group][label][stat]) == list:
                        PrintEncounterHeaders(f"{TabStr(2)}.encounterTypes =")
                        PrintEncounterHeaders(TabStr(2) + "{")

                        timeCounter = 0
                        while timeCounter < TIMES_OF_DAY_COUNT:
                            monInfo = headerStructTable[group][label][stat][timeCounter]
                            PrintEncounterHeaders(f"{TabStr(3)}[{TIME_OF_DAY.vals[timeCounter]}] = ")

                            infoIndex = 0
                            while infoIndex < len(fieldData):
                                if infoIndex == 0:
                                    PrintEncounterHeaders(TabStr(3) + "{")

                                if len(monInfo) == 0:
                                    PrintEncounterHeaders(f"{TabStr(4)}{GetIMonInfoStringFromIndex(infoIndex)} = NULL,")
                                else:
                                    PrintEncounterHeaders(f"{TabStr(4)}{GetIMonInfoStringFromIndex(infoIndex)} = {monInfo[infoIndex]},")

                                if infoIndex == len(fieldData) - 1:
                                    PrintEncounterHeaders(TabStr(3) + "},")

                                infoIndex += 1
                            timeCounter += 1
                        PrintEncounterHeaders(TabStr(2) + "},")
                PrintEncounterHeaders(tabStr + "},")

                if labelCount + 1 == headerStructTable[group][label]["encounterTotalCount"]:
                    PrintEncounterHeaders(tabStr + "{")
                    PrintEncounterHeaders(f"{TabStr(2)}.mapGroup = {GetMapGroupEnum(MAP_UNDEFINED)},")
                    PrintEncounterHeaders(f"{TabStr(2)}.mapNum = {GetMapGroupEnum(MAP_UNDEFINED, labelCount + 1)},")

                    nullCount = 0
                    while nullCount < TIMES_OF_DAY_COUNT:
                        if nullCount == 0:
                            PrintEncounterHeaders(f"{TabStr(2)}.encounterTypes =")
                            PrintEncounterHeaders(TabStr(2)+ "{")

                        PrintEncounterHeaders(f"{TabStr(3)}[{TIME_OF_DAY.vals[nullCount]}] = ")

                        nullIndex = 0
                        while nullIndex <= len(fieldData) - 1:
                            if nullIndex == 0:
                                PrintEncounterHeaders(TabStr(3) + "{")

                            PrintEncounterHeaders(f"{TabStr(4)}{GetIMonInfoStringFromIndex(nullIndex)} = NULL,")

                            if nullIndex == len(fieldData) - 1:
                                PrintEncounterHeaders(TabStr(3) + "},")

                            nullIndex += 1
                        nullCount += 1
                    PrintEncounterHeaders(TabStr(2) + "},")
                    PrintEncounterHeaders(tabStr + "},")
                labelCount += 1
        groupCount += 1
        PrintEncounterHeaders("};")


def GetWildMonHeadersLabel():
        return f"{baseStruct}{structHeader} {MON_HEADERS[headerIndex]}{structHeader}s{structArrayAssign}" + "\n{"


def PrintEncounterHeaders(content):
    if printEncounterHeaders:
        print(content)


def PrintEncounterRateMacros():
    if not printEncounterRateMacros:
        return

    fieldCounter = 0
    # len(fieldData) - 1 here so we skip hidden_mons
    while fieldCounter < len(fieldData) - 1: 
        tempName = fieldData[fieldCounter]["name"].upper()
        if "groups" not in fieldData[fieldCounter]:
            rateCount = 0
            for percent in fieldData[fieldCounter]["encounter_rates"]:
                if rateCount == 0:
                    print(f"{define} {ENCOUNTER_CHANCE}_{tempName}_{SLOT}_{rateCount} {percent}")
                else:
                    print(
                        f"{define} {ENCOUNTER_CHANCE}_{tempName}_{SLOT}_{rateCount} {ENCOUNTER_CHANCE}_{tempName}_{SLOT}_{rateCount - 1} + {percent}"
                    )

                if rateCount + 1 == len(fieldData[fieldCounter]["encounter_rates"]):
                    print(
                        f"{define} {ENCOUNTER_CHANCE}_{tempName}_{TOTAL} ({ENCOUNTER_CHANCE}_{tempName}_{SLOT}_{rateCount})"
                    )

                rateCount += 1
        else:
            rates = fieldData[fieldCounter]["encounter_rates"]
            groups = fieldData[fieldCounter]["groups"]

            for method in groups:
                method_indices = groups[method]
                if not method_indices:
                    continue

                for i, methodPercentIndex in enumerate(method_indices):
                    if methodPercentIndex < 0 or methodPercentIndex >= len(rates):
                        print(f"#error Invalid fishing encounter rate index {methodPercentIndex} for {method.upper()}")
                        continue

                    rate_value = rates[methodPercentIndex]
                    if i == 0:
                        print(f"{define} {ENCOUNTER_CHANCE}_{tempName}_{method.upper()}_{SLOT}_{methodPercentIndex} {rate_value}")
                    else:
                        previous_method_index = method_indices[i - 1]
                        print(f"{define} {ENCOUNTER_CHANCE}_{tempName}_{method.upper()}_{SLOT}_{methodPercentIndex} {ENCOUNTER_CHANCE}_{tempName}_{method.upper()}_{SLOT}_{previous_method_index} + {rate_value}")

                    if i == len(method_indices) - 1:
                        print(f"{define} {ENCOUNTER_CHANCE}_{tempName}_{method.upper()}_{TOTAL} ({ENCOUNTER_CHANCE}_{tempName}_{method.upper()}_{SLOT}_{methodPercentIndex})")

        fieldCounter += 1
    print()


def GetTimeLabelFromString(string):
    time = "TIME"
    time_ = "TIME_"

    if string == "TIMES_OF_DAY_COUNT":
        return string

    if time_ in string.upper():
        return string[len(time_):len(string)]
    elif time in string.upper():
        return string[len(time):len(string)]
    return string


def GetIMonInfoStringFromIndex(index):
    return fieldData[index]["infoStringBase"]


def GetMapGroupEnum(string, index = 0):
    if "MAP_" in string and index == 0:
        return "MAP_GROUP(" + string[4:len(string)] + ")"
    elif "MAP_" in string and index != 0:
        return "MAP_NUM(" + string[4:len(string)] + ")"
    return index


"""
get copied lhea :^ ) 
- next three functions copied almost verbatim from @lhearachel's python scripts in tools/learnset_helpers
"""
def PrintGeneratedWarningText():
    print("//")
    print("// DO NOT MODIFY THIS FILE! It is auto-generated by tools/wild_encounters/wild_encounters_to_header.py")
    print("//")
    print("\n")


def IsConfigEnabled():
    CONFIG_ENABLED_PAT = re.compile(r"#define OW_TIME_OF_DAY_ENCOUNTERS\s+(?P<cfg_val>[^ ]*)")

    with open("./include/config/overworld.h", "r") as overworld_config_file:
        config_overworld = overworld_config_file.read()
        config_setting = CONFIG_ENABLED_PAT.search(config_overworld)
        return config_setting is not None and config_setting.group("cfg_val") in ("TRUE", "1")


def GetTimeEnum():
    DEFAULT_TIME_PAT = re.compile(r"enum\s+TimeOfDay\s*\{(?P<rtc_val>[\s*\w+,\=\d*]+)\s*\}\s*\;")

    with open("./include/rtc.h", "r") as rtc_include_file:
        include_rtc = rtc_include_file.read()
        include_enum = DEFAULT_TIME_PAT.search(include_rtc)
        return include_enum.group("rtc_val")


def CheckEmpty(string):
    return string == "" or string.isspace() or string == "\n"


def SetupUserTimeEnum(timeOfDay):
    enum_string = GetTimeEnum()
    enum_string = enum_string.split(",")

    # check for extra element from trailing comma
    if CheckEmpty(enum_string[-1]):
        enum_string.pop(-1)

    # we don't need the `TIMES_OF_DAY_COUNT` value, so - 1 from the value of len(enum_string)
    strCount = 0
    while strCount < len(enum_string) - 1:
        tempStr = enum_string[strCount].strip("\n ")

        """
        we need to ignore any value assignments, as the times will need to correspond
        with the elements in the array.
        """
        if "=" in tempStr:
            tempStr = tempStr[0:tempStr.index("=")]
            tempStr = tempStr.strip(" ")

        #double check we didn't catch any empty values
        if not CheckEmpty(enum_string[strCount]):
            timeOfDay.add(tempStr)

        strCount += 1
    return timeOfDay


def TabStr(amount):
    return tabStr * amount


def GetPascalCase(string):
    stringArray = string.split("_")
    pascalString = ""

    for string in stringArray:
        pascalString += string.capitalize()
    return pascalString


def GetSnakeCase(string):
    stringArray = string.split("_")
    snakeString = ""

    i = 0
    for string in stringArray:
        if i == 0:
            snakeString += string
        else:
            snakeString += string.capitalize()

        i += 1
    return snakeString


def main():
    pass


if __name__ == "__main__":
    ImportWildEncounterFile()


"""
!!!! EXAMPLE OUTPUT !!!!
- when OW_TIME_OF DAY_ENCOUNTERS is FALSE in configoverworld.h

#define ENCOUNTER_CHANCE_LAND_MONS_SLOT_0 20
#define ENCOUNTER_CHANCE_LAND_MONS_SLOT_1 ENCOUNTER_CHANCE_LAND_MONS_SLOT_0 + 20
#define ENCOUNTER_CHANCE_LAND_MONS_SLOT_2 ENCOUNTER_CHANCE_LAND_MONS_SLOT_1 + 10
#define ENCOUNTER_CHANCE_LAND_MONS_SLOT_3 ENCOUNTER_CHANCE_LAND_MONS_SLOT_2 + 10
#define ENCOUNTER_CHANCE_LAND_MONS_SLOT_4 ENCOUNTER_CHANCE_LAND_MONS_SLOT_3 + 10
#define ENCOUNTER_CHANCE_LAND_MONS_SLOT_5 ENCOUNTER_CHANCE_LAND_MONS_SLOT_4 + 10
#define ENCOUNTER_CHANCE_LAND_MONS_SLOT_6 ENCOUNTER_CHANCE_LAND_MONS_SLOT_5 + 5
#define ENCOUNTER_CHANCE_LAND_MONS_SLOT_7 ENCOUNTER_CHANCE_LAND_MONS_SLOT_6 + 5
#define ENCOUNTER_CHANCE_LAND_MONS_SLOT_8 ENCOUNTER_CHANCE_LAND_MONS_SLOT_7 + 4
#define ENCOUNTER_CHANCE_LAND_MONS_SLOT_9 ENCOUNTER_CHANCE_LAND_MONS_SLOT_8 + 4
#define ENCOUNTER_CHANCE_LAND_MONS_SLOT_10 ENCOUNTER_CHANCE_LAND_MONS_SLOT_9 + 1
#define ENCOUNTER_CHANCE_LAND_MONS_SLOT_11 ENCOUNTER_CHANCE_LAND_MONS_SLOT_10 + 1
#define ENCOUNTER_CHANCE_LAND_MONS_TOTAL (ENCOUNTER_CHANCE_LAND_MONS_SLOT_11)
#define ENCOUNTER_CHANCE_WATER_MONS_SLOT_0 60
#define ENCOUNTER_CHANCE_WATER_MONS_SLOT_1 ENCOUNTER_CHANCE_WATER_MONS_SLOT_0 + 30
#define ENCOUNTER_CHANCE_WATER_MONS_SLOT_2 ENCOUNTER_CHANCE_WATER_MONS_SLOT_1 + 5
#define ENCOUNTER_CHANCE_WATER_MONS_SLOT_3 ENCOUNTER_CHANCE_WATER_MONS_SLOT_2 + 4
#define ENCOUNTER_CHANCE_WATER_MONS_SLOT_4 ENCOUNTER_CHANCE_WATER_MONS_SLOT_3 + 1
#define ENCOUNTER_CHANCE_WATER_MONS_TOTAL (ENCOUNTER_CHANCE_WATER_MONS_SLOT_4)
#define ENCOUNTER_CHANCE_ROCK_SMASH_MONS_SLOT_0 60
#define ENCOUNTER_CHANCE_ROCK_SMASH_MONS_SLOT_1 ENCOUNTER_CHANCE_ROCK_SMASH_MONS_SLOT_0 + 30
#define ENCOUNTER_CHANCE_ROCK_SMASH_MONS_SLOT_2 ENCOUNTER_CHANCE_ROCK_SMASH_MONS_SLOT_1 + 5
#define ENCOUNTER_CHANCE_ROCK_SMASH_MONS_SLOT_3 ENCOUNTER_CHANCE_ROCK_SMASH_MONS_SLOT_2 + 4
#define ENCOUNTER_CHANCE_ROCK_SMASH_MONS_SLOT_4 ENCOUNTER_CHANCE_ROCK_SMASH_MONS_SLOT_3 + 1
#define ENCOUNTER_CHANCE_ROCK_SMASH_MONS_TOTAL (ENCOUNTER_CHANCE_ROCK_SMASH_MONS_SLOT_4)
#define ENCOUNTER_CHANCE_FISHING_MONS_GOOD_ROD_SLOT_2 60
#define ENCOUNTER_CHANCE_FISHING_MONS_GOOD_ROD_SLOT_3 ENCOUNTER_CHANCE_FISHING_MONS_GOOD_ROD_SLOT_2 + 20
#define ENCOUNTER_CHANCE_FISHING_MONS_GOOD_ROD_SLOT_4 ENCOUNTER_CHANCE_FISHING_MONS_GOOD_ROD_SLOT_3 + 20
#define ENCOUNTER_CHANCE_FISHING_MONS_GOOD_ROD_TOTAL (ENCOUNTER_CHANCE_FISHING_MONS_GOOD_ROD_SLOT_4)
#define ENCOUNTER_CHANCE_FISHING_MONS_OLD_ROD_SLOT_0 70
#define ENCOUNTER_CHANCE_FISHING_MONS_OLD_ROD_SLOT_1 ENCOUNTER_CHANCE_FISHING_MONS_OLD_ROD_SLOT_0 + 30
#define ENCOUNTER_CHANCE_FISHING_MONS_OLD_ROD_TOTAL (ENCOUNTER_CHANCE_FISHING_MONS_OLD_ROD_SLOT_1)
#define ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_SLOT_5 40
#define ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_SLOT_6 ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_SLOT_5 + 40
#define ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_SLOT_7 ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_SLOT_6 + 15
#define ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_SLOT_8 ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_SLOT_7 + 4
#define ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_SLOT_9 ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_SLOT_8 + 1
#define ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_TOTAL (ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_SLOT_9)

const struct WildPokemon gRoute101_LandMons_Day[] =
{
    { 2, 2, SPECIES_WURMPLE },
    { 2, 2, SPECIES_POOCHYENA },
    { 2, 2, SPECIES_WURMPLE },
    { 3, 3, SPECIES_WURMPLE },
    { 3, 3, SPECIES_POOCHYENA },
    { 3, 3, SPECIES_POOCHYENA },
    { 3, 3, SPECIES_WURMPLE },
    { 3, 3, SPECIES_POOCHYENA },
    { 2, 2, SPECIES_ZIGZAGOON },
    { 2, 2, SPECIES_ZIGZAGOON },
    { 3, 3, SPECIES_ZIGZAGOON },
    { 3, 3, SPECIES_ZIGZAGOON },
};

const struct WildPokemonInfo gRoute101_Day_LandMonsInfo= { 20, gRoute101_Day_LandMons };
const struct WildPokemonHeader gWildMonHeaders[] =
{
    {
        .mapGroup = MAP(ROUTE101),
        .mapNum = MAP_NUM(ROUTE101),
        .encounterTypes =
            [OW_TIME_OF_DAY_DEFAULT] =
            {
                .encounterTypes[timeOfDay].landMonsInfo = &gRoute101_LandMonsInfo,
                .encounterTypes[timeOfDay].waterMonsInfo = NULL,
                .encounterTypes[timeOfDay].rockSmashMonsInfo = NULL,
                .encounterTypes[timeOfDay].fishingMonsInfo = NULL,
                .encounterTypes[timeOfDay].hiddenMonsInfo = NULL,
            }
    },
}
"""
