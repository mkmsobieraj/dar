#' Summary
#'
#' Function
#'
#' @import dplyr ggplot
Summary <- function(prediction) {


    self <- init("Summary",
                 list(
                    ..prediction = prediction,
                    TPR_FPR_by_cut_off  = NULL
                    )
                )


    self$TPR_FPR_by_cut_off <- calc_TPR_TPR_by_cutoff(self)

    class(self) <- c(class(self), "Summary")
    return(self)
}

print.Summary <- function(self) {
    cat("Summary object")
}

calculate__PR.Summary = function(self, cuoff, T_F) {

    mask_success <- self$..prediction$real_values == self$..prediction$success
    mask_failure <- !mask_success

    success_predictions <- self$..prediction$probabilities[mask_success]
    failure_predictions <- self$..prediction$probabilities[mask_failure]


    pred <- if (T_F == "T")
        success_predictions
    else
        failure_predictions

    sum((pred > cuoff)) / length(pred)
}

calc_TPR_TPR_by_cutoff.Summary <- function(self) {

    cutofs = seq(0, 1, by = 0.03)

    TPR_FPR <-
        sapply(cutofs, function(cutof, self){
            return(c(
                cutof = cutof,
                TPR = calculate__PR(self, cutof, "T"),
                FPR = calculate__PR(self, cutof, "F")
            ))
        }, self = self) %>% t() %>% as_tibble()

    return(TPR_FPR)
}


plot.Summary <- function(self){
    self$TPR_FPR %>%
        ggplot(aes(FPR, TPR)) +
            geom_line(size = 1.5, alpha= 0.4, linetype = 2, colour = "#ff9060") +
            geom_text(aes(label = cutof), hjust = 0, nudge_x = 0.01, alpha = 0.8)
}
