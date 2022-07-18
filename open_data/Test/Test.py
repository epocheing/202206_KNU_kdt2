import re

p = re.compile(r"\w+")
pp = re.compile(r"(.*\w+)\s*[(].*$")

r = p.search("대구광역시 동구 신암동(2312312312321)")
rr = pp.match("대구광역시 동구 신암동  (2312312312321)")

print(r)
print(rr.group(1))
