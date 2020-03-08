#!/usr/bin/python

def test(object,value):
    for key in object:
        if key == value:
            print(object[key])
        else:
            test(object[key],value)

test({'a':{'b':{'c':'d'}}},"b")
