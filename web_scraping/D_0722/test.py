import re

p = re.compile(r"(^\d{2,4}[-]\d{3,4}[-]\d*$|^[.]$|^[없][음]$)")

print(p.match("없음"))
