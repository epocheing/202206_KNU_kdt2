import re

p = re.compile(r"\s\w+\s")

r = p.search("대구광역시 동구 신암동(2312312312321)")
print(r)
