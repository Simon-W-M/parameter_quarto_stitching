library(quarto)

# single report

params = list(child_a = TRUE, 
              child_b = TRUE, 
              cyl = 8)


quarto_render(input = 'parent.qmd', 
              output_file = paste0('demo',params$cyl,'.html'), 
              execute_params = c(params))

#################################################################

# multi report

# set up a data frame with the parameters
child_a <- c(TRUE, TRUE, FALSE)
child_b <- c(TRUE, FALSE, TRUE)
cyl <- c(4,6,8)
loop_df <- data.frame(child_a, child_b, cyl)


for (i in seq(1:3)) {
  print(paste0('Running report for cyl:',loop_df$cyl[i]))
  
  # pull parameters from table
  params <- list(
    cyl = loop_df$cyl[i],
    child_a = loop_df$child_a[i],
    child_b = loop_df$child_b[i]
  )

  rmarkdown_render(
    input = "parent.qmd",
    output_file = paste0("demo", loop_df$cyl[i], ".html"),
    execute_params = c(params)
  )
}

