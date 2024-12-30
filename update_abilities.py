m = {}
with open('gen_123_families.h', 'r') as in_file:
  mon = None
  for line in in_file:
    l = line.strip()
    if l.startswith('[SPECIES_'):
      mon = l
    elif l.startswith('.abilities') and (mon not in m) and ('GENGAR_ABILITIES' not in l) and ('ABILITY_NEUTRALIZING_GAS' not in l) and ('ABILITY_COMPETITIVE' not in l) and ('ABILITY_SHARPNESS' not in l) and ('ABILITY_WIND_RIDER' not in l):
      try:
        m[mon] = l[0:l.index(',', l.index(',')+1)] + '},'
      except:
        continue

s = ''
with open('src/data/pokemon/species_info.h', 'r') as out_file:
  mon = None
  for line in out_file:
    l = line.strip()
    if l.startswith('[SPECIES_'):
      mon = l
    elif l.startswith('.abilities'):
      try:
        line = '        ' + m.get(mon, None) + '\n'
      except:
        line = line
    s += line

with open('src/data/pokemon/species_info.h', 'w') as out_file:
  out_file.write(s)

