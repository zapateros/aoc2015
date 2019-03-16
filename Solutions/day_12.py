import json

with open('input_day_12.txt','rb') as inp:
    x = inp.read().strip()
json = json.loads(x)

for part in range(1,3):
    def sum_all(json):
        if isinstance(json, int):
            return json
        elif isinstance(json, str) or isinstance(json,unicode):
            return 0
        elif isinstance(json, list) or isinstance(json,tuple):
            return sum(sum_all(x) for x in json)
        elif isinstance(json, dict):
            if(part == 2):
                if 'red' in json.values():
                    return 0
                else:
                    return sum_all(json.values())
            return sum_all(json.values())

    print "Part", part,":", sum_all(json)
