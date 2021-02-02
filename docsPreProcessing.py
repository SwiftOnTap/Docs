import re

def main():
    with open('SwiftUI.swift', 'r') as reader:
        str = reader.read()

    # Read in file as string
    # str = TEXT
    # Replace instances of "protocol (.*?) {" with "protocol (.*?) { } extension (.*?)"
    # Get all instances of protocol (.*?)
    allProtocols = re.findall(r' protocol (.*?) {', str)
    moreProtocols = re.findall(r' protocol (.*?) : ', str)
    allProtocols += moreProtocols

    data = list(dict.fromkeys(allProtocols))

    for declaration in data:

        current = " protocol " + declaration + " {"
        new = " protocol " + declaration + "{ }" + "\n" + "extension " + declaration + " {"
        str = str.replace(current, new)

    f = open("tempData.txt", 'a')
    f.write(str)
    f.close()

    return str
