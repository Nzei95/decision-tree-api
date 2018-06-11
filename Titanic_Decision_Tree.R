# Get the data
data <- read.csv('train.csv'
  , header=TRUE
  , sep=,
)

# Include the rpart library, you may want to install the package first
# install.packages('rpart')
library(rpart)
# Build a tree
# I already figured these significant variables from my first iteration (not shown in this code for simplicity)
my_tree_two <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data = data, method = "class")
# Install rpart.plot package to enable visualisation of the decision tree
install.packages("rpart.plot")
library(rpart.plot)
# Visualize the tree
prp(
  my_tree_two
  , extra=1
  , varlen=0
  , faclen=0
  , main="Sample Decision Tree"
)

# Save file 
save(my_tree_two, file='decision_Tree_for_test.RData')
