source("startup.R")

shinyUI(
    navbarPage(
        "Shiny", 
        tabPanel("Visualize",
                 fluidPage(
                     pageWithSidebar(
                         headerPanel('Mutually Exclusive List Selection'),
                         sidebarPanel(
                           HTML("<h4><b>Specify variable treatment</b></h4>"),
                           uiOutput("greMe"), uiOutput("bluMe"), uiOutput("redMe"), uiOutput("yelMe"),
                           HTML("<h5><b>Note: Each variable may be only selected once from above.</b></h5>"),
                           HTML("<h5><b>Note: You can only specify a max of 4 total options.</b></h5>")
                         ),
                         mainPanel(
                             plotlyOutput('plot1')
                         )
                     )
                 )
        ),
                            
        ##########
        # FOOTER
        ##########
        
        theme = shinytheme("cerulean"),
        footer = HTML(paste0('<P ALIGN=Center>Mutually Exclusive List Selection &copy; <A HREF="mailto:caleblareau@g.harvard.edu">Caleb Lareau</A>')),
        collapsible = TRUE, 
        fluid = TRUE,
        windowTitle = "MES"
    )
)
