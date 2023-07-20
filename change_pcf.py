# A script I used to re-index the pins in the pcf file

import re, numpy as np

# led_pattern = re.compile("set_io LED([0-9]+) ")
# io_led_pattern = re.compile("set_io IO_LED([0-9]+) ")
# io_dip_pattern = re.compile("set_io DIP([0-9]+) ")

pin_pattern = re.compile(r"set_io ([A-Z_]+)\[([0-9]+)\] ([A-Z][0-9]+) ")

# buffer = ""

pins = np.zeros((7, 14), dtype=np.int8)

with open("cu.pcf", 'r', encoding="ascii") as f:
    for line in f:
        match = pin_pattern.search(line)

        if match:
            print(match.group(1), match.group(2), match.group(3))

            pins[ord(match.group(3)[0]) - ord('A'), int(match.group(3)[1:]) - 1] += 1

        # line = led_pattern.sub(lambda m: "set_io LED[" + str(int(m.group(1)) - 1) + "] ", line)
        # line = io_led_pattern.sub(lambda m: "set_io IO_LED[" + str(int(m.group(1)) - 1) + "] ", line)
        # line = io_dip_pattern.sub(lambda m: "set_io IO_DIP[" + str(int(m.group(1)) - 1) + "] ", line)



        # buffer += line
        # print(line)

print(pins)

# with open("cu.pcf", 'w', encoding="ascii") as f:
#     f.write(buffer)
