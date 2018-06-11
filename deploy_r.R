library(rpart)
library(jsonlite)
# Load the decision tree file
load("decision_Tree_for_test.RData")

# Specify the request method
#* @post /predict
predict.default.rate <- function(
  Pclass
  , Sex
  , Age
  , SibSp, Parch, Fare, Embarked
) {
  data <- list(
   Pclass=Pclass, Sex=Sex, Age=Age, SibSp=SibSp, Parch=Parch, Fare=Fare, Embarked=Embarked
  )
  prediction <- predict(my_tree_two, data)
  return(list(default.probability=unbox(prediction[1, 2])))
}

# Run and test your api using plumber in R, run the following commands 
# in the console window in R studio
# library(plumber)
# Specify the file you want to run 
# r <- plumb("deploy_r.R") 
# Specify the port number 
# r$run(port=8000)
