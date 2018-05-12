Prediction <- function(real_values = NULL,
                       predicted_values = NULL,
                       probabilities = NULL,
                       success = 1,
                       failure = 0,
                       data_frame = NULL) {

     self <- init("Prediction",
                  list(
                      real_values = real_values,
                      predicted_values = predicted_values,
                      probabilities = probabilities,
                      success = success,
                      failure = failure
                      )
                )

    return(self)
}
