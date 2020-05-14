library(arules)
library(arulesViz)
#groceries<- read.transactions(file.choose())
groceries <- read.csv("D:\\mywork\\R project\\Market_basket_analysis_3rd_yr\\groceries.csv")
rules <- apriori(groceries)
rules <- apriori(groceries, parameter = list(supp = 0.01, conf = 0.8))
inspect(rules[1:5])
summary(rules)
rules<-sort(rules, by="support", decreasing=T)
options(digits=2)
inspect(rules[1:5])
rules
redundant_rules <- is.redundant(rules)
redundant_rules
summary(redundant_rules)
rules<-rules[!redundant_rules]
rules
inspect(rules[1:10])
rules_margarine <- apriori(groceries,parameter = list(supp = 0.0001, conf = 0.8), appearance = list(default = "rhs", lhs = "margarine="))
rules_margarine <- apriori(groceries,parameter = list(supp = 0.00000001, conf = 0.1), appearance = list(default = "rhs", lhs = "citrus.fruit=canned beer"))
inspect(rules_margarine[1:2])
top20 <- rules[1:20]
plot(top20, method = "graph")
plot(rules, method = "graph", interactive = T)