with open('new_tms.txt','r') as in_file:
  i = 1
  for _ in range(64):
    num = str(92+i).zfill(3)
    print('#define ITEM_TM' + num + ' ' + str(388+i))
    i += 1

  print()
  i = 1
  for line in in_file:
    num = str(92+i).zfill(3)
    print('#define ITEM_TM' + num + '_' + line.strip() + ' ITEM_TM' + num)
    i += 1

