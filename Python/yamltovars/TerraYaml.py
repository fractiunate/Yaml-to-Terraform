import json
import os
import yaml
import argparse
from pykwalify.core import Core

def parse_yaml(yaml, indent):
    
    terrafile = ""
    line = ""
    
    for k, v in yaml.items():
        
        if isinstance(v, str):
            line = k + " = " + '"' + v + '"' + "\n"
        if isinstance(v, dict):
            line = parse_dict(v, k, indent, indent)
        if isinstance(v, list):
            line = parse_list(v, k, indent, indent)
        terrafile = terrafile + line + "\n"

    return terrafile

def parse_list(mylist, listname, indent, currentident):
    
    endlistitem = "}\n"

    if all(isinstance(item, str) for item in mylist):

        line = listname + " = " + str(mylist).replace("'", '"') + "\n"
        line = line.rjust(len(line)+ currentident)
        
        return line

    line = listname + " = {\n"
    
    for count, lijstitem in enumerate(mylist):
        
        listitem = listname + str(count) + " = {\n"
        line = line + listitem.rjust(len(listitem) + currentident)
        
        if isinstance(lijstitem, dict):
            line = line + parse_dict(lijstitem, "", indent, currentident + indent)         
        elif isinstance(lijstitem, list):
            line = line +  parse_list(lijstitem, listname, indent, currentident + indent)
        else:
            line= line + str(lijstitem) + "\n"

        line = line + endlistitem.rjust(len(endlistitem) + currentident)

    return line + endlistitem.rjust(len(endlistitem) + (currentident - indent))

def parse_dict(mydict, dictname, indent, currentident):
    
    endlistitem = "}\n"
    
    if dictname == "":
        line = ""
    else:
        line = (dictname + " = {\n")
    for label, value in mydict.items():

        if isinstance(value, list):
            rcline = parse_list(value, label, indent, currentident + indent)
            line = line + rcline.rjust(len(rcline) + currentident)
        elif isinstance(value, dict):
            rcline = parse_dict(value, label, indent, currentident + indent)
            line = line + rcline.rjust(len(rcline) + currentident)
        else:
            dictitem = label + " = " + '"' + str(value) + '"' + "\n"
            line = line + dictitem.rjust(len(dictitem) + currentident)
            
    if dictname == "":
        return line
    else:
        return line + endlistitem.rjust(len(endlistitem) + (currentident - indent))

def return_list_of_string(listname):
    if all(isinstance(item, str) for item in listname):
        return str(listname)
    else:
        return ""