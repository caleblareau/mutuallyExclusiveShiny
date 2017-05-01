# Create Mutually Exclusive Shiny Inputs
Born out of my frustration in trying to solve this in a more complicated app.

### What's going on here?
Image that you have a vector that you want to partition into input. In this example,
I'm splitting the 50 states into red, yellow, blue, and green colors where if a state
is not selected, then it remains black. In the drop-down/selectize input configuration,
I wanted to be able to only show options that were not otherwise selected. Moreover,
I wanted to cap the total number of total items selected at some fixed number. After
struggling with this for a while (notably-- I tried using the `updateSelectizeInput`
function multiple times and wound up deciding that it was somehow white-washing my
server-side input for reasons that are still not clear to me), I settled on this framework
as a minimal working example that seems to work adequately well. 

### See it for yourself--

In the `RStudio` console, execute the following (assumes everything needed is installed)--
```
shiny::runGitHub("mutuallyExclusiveShiny", "caleblareau", display.mode = "showcase") 
```
to see the demo app with the code side-by-side. 