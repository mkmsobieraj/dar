init <- function(class_name, args){
    if (missing(args))
        self <- list()
    else
        self <- args

    class(self) <- c(class(self), class_name)
    return(self)
}
