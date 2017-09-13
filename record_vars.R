#Eric Peterson 20170913
#TODO: enable PDF/HTML and embedded plot outputs
#TODO: add explicit variable names for match as well
gather_vars <- function(env=.GlobalEnv, varnamematch="_save"){
  envars <- ls(env)
  envars <- envars[grep(varnamematch, envars)]
  envarlist <- mget(envars, envir = env)
  return(envarlist)
}

write_var_table <- function(varlist, fname){
  a <- FALSE
  vnames <- sort(names(varlist))
  for (vn in vnames){
    df <- data.frame(name=vn, value=varlist[vn])
    write.table(df, file = fname, append = a, sep = ",", col.names = FALSE,
                row.names = FALSE)
    a <- TRUE
  }
}

record_vars <- function(fname, env=.GlobalEnv, varnamematch="_save"){
  vars <- gather_vars(env, varnamematch)
  write_var_table(vars, fname)
}