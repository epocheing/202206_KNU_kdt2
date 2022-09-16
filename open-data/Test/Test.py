import re

p = re.compile(r"^0?8.?\s?(\d|1\d|2\d|30|31)\w?$")

m = "08.12일"

print(p.match(m))
