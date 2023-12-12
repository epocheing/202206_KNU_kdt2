import re

p = re.compile(r"t'></td>$")
m = "<td class='center_t'></td>"

m = p.search(m)
print(type(p))
