#!/usr/bin/python

import os
import i3ipc

i3 = i3ipc.Connection()

windows = []

for ws in i3.get_workspaces():
    if ws.focused == True:
        workspace = ws.name
        #print(workspace)

for con in i3.get_tree():
    if (con.window
            and con.parent.type != 'dockarea'
            and con.workspace().name == workspace
            and con.window_class != "Tilda"):
        windows.append(con.window_class)

#print(", ".join(windows).title())

message = "Workspace " + workspace #+ "\n" + ", ".join(windows).title()

command = "dunstify -a workspace -t 3000 \"" + message + "\" \"" + "\n".join(windows).title() + "\" --replace=42069"

#print(command)

os.system(command)
