#' Compile front matter to PDF
#'
#' To use this function, one needs to be in the
#' \emph{root directory} of the bookdown project.
#'
#' @examples
#' \dontrun{
#' setwd("~/my-thesis")
#' comp_front(template = 'ntu')
#' }
#' @importFrom rlang abort
#' @keywords internal
comp_front_ntu <- function() {
  call_dir <- getwd()
  stopifnot(dir.exists("front_matter"),
            file.exists("_person-info.yml"))

  setwd("front_matter")
  on.exit(setwd(call_dir), add = T)

  # Construct front_matter.rmd
  construct_front_rmd_ntu()

  # Compile to PDF
  rmarkdown::render("front_matter.rmd", encoding = "UTF-8")
  fp <- "certification.tex"
  if (!file.exists(fp)) {
    abort(paste0('`', fp,'` ',
                 'not in folder `front_matter`.'))
  } else {
    system2("xelatex", args = fp, stdout = FALSE)
  }

  # Clean up dependencies
  files <- c('certification.aux', 'certification.log', 'front_matter.rmd', 'front_matter.tex')
  clean_front_matter(files)
}


#' Construct 'front_matter.rmd' for ntu template
#'
#' Construct \code{front_matter.rmd} from \code{front_matter/output.yml}
#' and \code{_person-info} in root. This function is expected to work
#' in the directory \code{front_matter/}.
#'
#' @param person_info File path to \code{_person-info.yml}.
#'
#' @keywords internal
construct_front_rmd_ntu <- function(person_info = '../_person-info.yml'){

  person_info <- paste(readLines(person_info),
                       collapse = "\n")
  endlines <- paste(readLines("output.yml"),
                    collapse = "\n")

  write('---',
        file = "front_matter.rmd")
  write(person_info,
        file = "front_matter.rmd", append = T)
  write(endlines,
        file = "front_matter.rmd", append = T)
  write('---',
        file = "front_matter.rmd", append = T)
}
