#!/usr/bin/env python3

'''
deletes object events, coord events, and hidden item events from a map json file
run this script from inside the pokefirered root directory
'''

import json
import glob

from collections import OrderedDict


def get_map_data(path=""):
    
    map_data = OrderedDict()
    with open(path, 'r', encoding='utf-8') as f:
        map_data = json.loads(f.read(), object_pairs_hook=OrderedDict)

    return map_data


def write_map_json(path="", json_data=None):

    with open(path, 'w') as f:
        json.dump(json_data, f, indent=2, separators=(',', ': '))


def remove_event_data(map_data=OrderedDict()):

    # remove all object events
    map_data["object_events"] = []

    # remove all coord events
    map_data["coord_events"] = []

    # remove hidden item bg events
    indexes_to_delete = []
    index = 0
    for bg_event in map_data["bg_events"]:
        if bg_event["type"] == "hidden_item":
            indexes_to_delete.append(index)
        index += 1

    for event_index in reversed(indexes_to_delete):
        del map_data["bg_events"][event_index]


def main():

    # recursively search all map.json files
    for json_file in glob.iglob('data/maps/**/map.json', recursive=True):
        map_data = get_map_data(json_file)
        remove_event_data(map_data)
        write_map_json(json_file, map_data)

    pass


if __name__ == '__main__':
    main()
