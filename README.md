# The `]KeyPress` user command

`]KeyPress` shows a small GUI that reports the details of any key pressed on the keyboard.

![](keypress_screenshot.png)

This user command fires up a separate (additional) instance of Dyalog APL in order to execute the real code. The reason for this is that executing the code in `⎕SE` means that any accelerator key used on any of the menu items in the session would result in the "KeyPress" event not being send, therefore the GUI is not able to report those.

For quitting the application, you need to hit the `<escape>` key twice in succession.
