source("startup.R")

function(input, output, session) {
  
  # Set up reactive values
   
  rv <- reactiveValues(
      greMe = NULL,
      bluMe = NULL,
      redMe = NULL,
      yelMe = NULL,
      availParams = NULL, 
      allParams = state.abb,
      lengthAll = 0
  )
  
  maxLength <- 3 # adds one for reasons that are not clear to me
  
  ########################
  ### Selectize Stuff ####
  ########################
  
  observe({
    rv$greMe = input$greMe
    rv$bluMe = input$bluMe
    rv$redMe = input$redMe
    rv$yelMe = input$yelMe
    rv$availParams <- rv$allParams[!(rv$allParams %in% c(rv$greMe, rv$bluMe, rv$redMe, rv$yelMe))]
    rv$lengthAll <- length(c(rv$greMe, rv$bluMe, rv$redMe, rv$yelMe))
  })

    output$greMe <- renderUI({
      if(rv$lengthAll <= maxLength){ choices <-  c(rv$availParams, rv$greMe)} else { choices <-  rv$greMe}
      selectizeInput('greMe', "Green States", choices = choices, selected = rv$greMe, multiple = TRUE)
    })

    output$bluMe <- renderUI({
      if(rv$lengthAll <= maxLength){ choices <-  c(rv$availParams, rv$bluMe)} else { choices <-  rv$bluMe}
      selectizeInput('bluMe', "Blue States", choices = choices, selected = rv$bluMe, multiple = TRUE)
    })
  
    output$redMe <- renderUI({
      if(rv$lengthAll <= maxLength){ choices <-  c(rv$availParams, rv$redMe)} else { choices <-  rv$redMe}
      selectizeInput('redMe', "Red States", choices = choices, selected = rv$redMe, multiple = TRUE)
    })
    
    output$yelMe <- renderUI({
      if(rv$lengthAll < maxLength){ choices <-  c(rv$availParams, rv$yelMe)} else { choices <-  rv$yelMe}
      selectizeInput('yelMe', "Yellow States", choices = choices, selected = rv$yelMe, multiple = TRUE)
    })
    
  # Plot 1
  output$plot1 <- renderPlotly({
          
          colorInt <- rep(0, length(rv$allParams))
          colorInt[which(rv$allParams %in% rv$greMe)] <- 1 
          colorInt[which(rv$allParams %in% rv$bluMe)] <- 2
          colorInt[which(rv$allParams %in% rv$redMe)] <- 3
          colorInt[which(rv$allParams %in% rv$yelMe)] <- 4

          dfp <- data.frame(x      = rnorm(50),
                            y      = rnorm(50)^2,             
                            color = as.factor(colorInt),
                            params = rv$allParams)
    color <- c("black", "green4", "dodgerblue", "firebrick", "yellow")    
    cAA <- color[sort(unique(as.numeric(colorInt))) + 1]
    plot_ly(dfp, x = ~x, y = ~y, mode = "markers", color = ~color, colors = cAA,
        text = paste0("State:", dfp$params, "<br>", "ColorFactor: ", dfp$color, "<br>")) %>% layout(dragmode = "select")
  
  })
    
}


