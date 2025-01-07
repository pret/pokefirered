lower_to_upper_snake = {}
upper_snake_to_lower = {}
with open('new_tms.txt','r') as in_file:
  for line in in_file:
    us = line.strip()
    l = us.replace('_', '').lower()
    lower_to_upper_snake[l] = us
    upper_snake_to_lower[us] = l

with open('filtered_learnsets.ts','r') as in_file:
  mon = None
  for line in in_file:
    if len(line.strip()) == 0:
      continue
    if line[1].isalpha() and line.strip().endswith(': {'):
      mon = line.strip().replace(': {','')
      continue
    sp = line.strip().split(': ["')
    if len(sp) == 0:
      continue
    move = sp[0]
    print(move)
    # print(move)
