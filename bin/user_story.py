import random
import os

fname_list = ["as_a.txt", "i_want.txt", "so_i.txt"]
fpath_list = [ os.path.expanduser("~") + "/bin/user_stories/" + x
        for x in fname_list ]

file_list = [open(x, "r") for x in fpath_list]


my_choices = []
for f in file_list:
    line_list = [l for l in f]
    my_choices.append( random.choice( line_list ).strip() )
print( "As a {} I want {} so I {}".format(
    my_choices[0], my_choices[1], my_choices[2] ))

