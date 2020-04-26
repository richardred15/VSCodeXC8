import xml.etree.ElementTree as ET
import math

LINE_WIDTH = 60


def draw_line(text, center=False, indent=5):
    line = "|"
    remainder = (LINE_WIDTH - len(text))
    if center:
        half = math.floor(remainder/2)
        for i in range(half):
            line += " "
    else:
        remainder -= indent
        for i in range(indent):
            line += " "
    line += text
    count = half if center else remainder
    for i in range(count):
        line += " "
    line += "|"
    print(line)


def draw_bar(width, perc, indent=10):
    line = ""
    filled = math.floor(width * perc)
    for i in range(filled):
        line += "█"
    for i in range(width - filled):
        line += "░"
    draw_line(line, False, indent)


tree = ET.parse("dist\default\production\memoryFile.xml")
root = tree.getroot()
parts = root.findall("executable/memory")
prg_used = int(parts[0].findall("used")[0].text)
prg_free = int(parts[0].findall("free")[0].text)
prg_total = int(parts[0].findall("length")[0].text)
data_used = int(parts[1].findall("used")[0].text)
data_free = int(parts[1].findall("free")[0].text)
data_total = int(parts[1].findall("length")[0].text)

prg_rem = prg_used/prg_total
data_rem = data_used/data_total

print("==============================================================")
draw_line("PIC Mem Free", True)
draw_line("")
draw_line("")
draw_line("Program Memory: " + str(prg_used) + " - " +
          str(math.floor(prg_rem*1000)/10) + "%")
draw_bar(40, prg_rem)
draw_line("Data Memory: " + str(data_used) + " - " +
          str(math.floor(data_rem*1000)/10) + "%")
draw_bar(40, data_rem)
print("==============================================================")
