import re

p = re.compile("[()]")
city = "대구광역시 북구 산격 3동(248284284300)"
str_list = p.split(city)

print(str_list)
print(str_list[0])
print(str_list[1])

o = re.compile("[ ,:;]")
s = "apple orange:bababa,tomato;melon"

fruit_list = o.split(s)
print(fruit_list)
