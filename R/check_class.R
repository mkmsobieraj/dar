#' check_class
#'
#' Check is object an instance of specify calss. If nor raise exceptions
#'
#' @param object any object
#' @param class class name
#'
check_class(object, class) {

    comment <- sprintf("Object is not %s instance.
                       \\n Object clesses: %s", class, paste(object, collapse = ", "))

    if(!class %in% class(object)) {
        stop(comment)
    }
}
