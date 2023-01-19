import re

led_pattern = re.compile("set_io LED([0-9]+) ")
io_led_pattern = re.compile("set_io IO_LED([0-9]+) ")
io_dip_pattern = re.compile("set_io DIP([0-9]+) ")

print("HI")

buffer = ""

with open("cu.pcf", 'r', encoding="ascii") as f:
    print(f.readline())
    for line in f:
        line = led_pattern.sub(lambda m: "set_io LED[" + str(int(m.group(1)) - 1) + "] ", line)
        line = io_led_pattern.sub(lambda m: "set_io IO_LED[" + str(int(m.group(1)) - 1) + "] ", line)
        line = io_dip_pattern.sub(lambda m: "set_io IO_DIP[" + str(int(m.group(1)) - 1) + "] ", line)

        buffer += line
        print(line)

with open("cu.pcf", 'w', encoding="ascii") as f:
    f.write(buffer)
