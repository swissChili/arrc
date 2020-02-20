#!/usr/bin/env python3

while True:
    string = input("Enter a string > ")
    for c in list(string):
        print("\\{},".format(c))
