i = 0
with open('new_tms.txt', 'r') as file:
  for line in file:
    no = '{:03d}'.format(i+93)
    upper_snake = line.strip()
    pascal = ''.join([s[0] + s[1:].lower() for s in upper_snake.split('_')])

    item = '''    {
      "english": "TM''' + no + '''",
      "itemId": "ITEM_TM''' + no + '''",
      "price": 3000,
      "holdEffect": "HOLD_EFFECT_NONE",
      "holdEffectParam": 0,
      "description_english": "A new TM. It might not work\\\\nin this hack, but will in the online\\\\nbattle simulator!",
      "importance": 0,
      "registrability": 0,
      "pocket": "POCKET_TM_CASE",
      "type": "ITEM_TYPE_PARTY_MENU",
      "fieldUseFunc": "NULL",
      "battleUsage": 0,
      "battleUseFunc": "NULL",
      "secondaryId": 0,
      "moveId": "''' + pascal + '''"
    },'''
    print(item)
    i += 1
