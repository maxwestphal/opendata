get_path <- function(name, ..., dir=get_dir()){
  do.call(file.path, c(list(dir, name), list(...)))
}

