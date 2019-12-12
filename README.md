# The `]KeyPress` user command

This user command fires up a stand-alone EXE created with Dyalog 17.1 Unicode 64 bit. 

It shows a small GUI that reflects any key you press on the keyboard.

For quitting the application you need to hit the <escape> key twice in succession.

The reason why this became in 2019-12 a stand-alone application rather than executing the code in `⎕SE` is that any accelarator key used on any of the menu items in the session would take precedence over the user command, meaning that `OnKeyPress` cannot report such keys because the event would not be fired. For a stand-alone EXE this is of course not a problem.