#' Create a new Sweave file for database documentation
#'
#' @param db_obj A db-obj.
#' @param filename A character.
#' @param title A character.
#' @param author A character.
#' @param version A character.
#'
#' @return A character.
#' @export
#'
#' @examples
create_tex <- function(db_obj, filename, title, author, version){

  # Create new sweave file
  file.create(filename)

  # Write top contents into the file
  write("\\documentclass{report}",         file = filename, append = TRUE)
  write("\\begin{document}",               file = filename, append = TRUE)
  write("\\SweaveOpts{concordance=TRUE}",  file = filename, append = TRUE)
  write(" ",                               file = filename, append = TRUE)
  write(paste0("\\title{", title," \\\\"), file = filename, append = TRUE)
  write(paste0("  Version ", version,"}"), file = filename, append = TRUE)
  write(paste0("\\author{", author,"}"),   file = filename, append = TRUE)
  write("\\date{\\today{}}",               file = filename, append = TRUE)
  write("\\maketitle",                     file = filename, append = TRUE)
  write(" ",                               file = filename, append = TRUE)
  write("<<echo=FALSE>>=",                 file = filename, append = TRUE)
  write("library(statbanker)",             file = filename, append = TRUE)
  write("library(plotly)",                 file = filename, append = TRUE)
  write("library(statbanktools)",          file = filename, append = TRUE)
  write("library(mmdb)",                   file = filename, append = TRUE)
  write("library(Hmisc)",                  file = filename, append = TRUE)
  write("@",                               file = filename, append = TRUE)
  write(" ",                               file = filename, append = TRUE)

  # Create db_obj here
  write("<<echo=FALSE>>=",                 file = filename, append = TRUE)
  write("insert code here",                file = filename, append = TRUE)
  write("insert code here",                file = filename, append = TRUE)
  write("insert code here",                file = filename, append = TRUE)
  write("insert code here",                file = filename, append = TRUE)
  write("@",                               file = filename, append = TRUE)
  write(" ",                               file = filename, append = TRUE)

  # Write chunks for each variable in the database (excluding time and trend)
  for(i in colnames(db_obj@db)[-c(1:2)]){

    tex_var   <- Hmisc::latexTranslate(i)
    tex_desc  <- Hmisc::latexTranslate(paste0(get(i)@description,collapse = ", "))
    tex_units <- Hmisc::latexTranslate(paste0(get(i)@units,collapse = ", "))
    tex_src   <- Hmisc::latexTranslate(get(i)@table)

    # TABLE
    write(paste0("\\section*{",tex_var,"}"), file = filename, append = TRUE)
    #% \hskip-0.10cm
    write("\\begin{tabular}{ p{0.18\\linewidth} | p{0.6\\linewidth}  }", file = filename, append = TRUE)
    write(paste0("\\textbf{Variable} & ",tex_var," \\\\"), file = filename, append = TRUE)
    write("\\hline \\\\",file = filename, append = TRUE)
    write(paste0("\\textbf{Description} & ",tex_desc,"  \\\\"),file = filename, append = TRUE)
    write("\\hline \\\\",file = filename, append = TRUE)
    write(paste0("\\textbf{Units} & ",tex_units," \\\\"),file = filename, append = TRUE)
    write("\\hline \\\\",file = filename, append = TRUE)
    write(paste0("\\textbf{Source} & ",tex_src," \\\\"),file = filename, append = TRUE)
    write("\\hline \\\\",file = filename, append = TRUE)
    write(paste0("\\textbf{Start} & \\Sexpr{start(",i,"@data[,'level'])[1]} \\\\"),file = filename, append = TRUE)
    write("\\hline \\\\",file = filename, append = TRUE)
    write(paste0("\\textbf{End} & \\Sexpr{end(",i,"@data[,'level'])[1]} \\\\"),file = filename, append = TRUE)
    write("\\hline \\\\",file = filename, append = TRUE)
    write(paste0("\\textbf{No. Obs.} & \\Sexpr{length(",i,"@data[,'level'])} \\\\"),file = filename, append = TRUE)
    write("\\hline \\\\",file = filename, append = TRUE)
    write("\\textbf{Note} &  (none) \\\\",file = filename, append = TRUE)
    write("\\hline",file = filename, append = TRUE)
    write("\\end{tabular}",file = filename, append = TRUE)
    write(" ", file = filename, append = TRUE)

    # CHARTS
    write("<<echo=FALSE,fig=TRUE>>=",      file = filename, append = TRUE)
    write("par(family = 'Times')",         file = filename, append = TRUE)
    write("nf <- layout(matrix(c(1,1,1,1,2,3,2,3), nrow = 4, byrow = TRUE))", file = filename, append = TRUE)
    write("par(mai = c(0.2,0.5,0.5,0.42))", file = filename, append = TRUE)
    # lot(",i,"@data[,'level'],main=c(",i,"@description,",i,"@units),xlab='',ylab='',las=1)",file="tex_test.Rnw",append=TRUE)
    write(paste0("plot(db_obj@series[['",i,"']]@data[,'level'], main = 'Level', xlab = '', ylab = '', las = 1)"), file = filename, append = TRUE)
    write("par(mai = c(0.25,0.3,0.6,0.42))", file = filename, append = TRUE)
    write(paste0("plot(db_obj@series[['",i,"']]@data[,'Q-on-Q'], main = 'Percentage change', xlab = '', ylab = '', las = 1)"),file = filename, append = TRUE)
    write("abline(h = 0, lty = 2)",             file = filename, append = TRUE)
    write(paste0("plot(db_obj@series[['",i,"']]@data[,'Y-on-Y'], main = 'Annual percentage change', xlab = '', ylab = '', las = 1)"), file = filename, append = TRUE)
    write("abline(h = 0, lty = 2)",             file = filename, append = TRUE)
    write("@",                             file = filename, append = TRUE)
    write(" ",                             file = filename, append = TRUE)
  }

  # Write end of document into the file
  write("\\end{document}", file = filename, append = TRUE)

  return(filename)
}
