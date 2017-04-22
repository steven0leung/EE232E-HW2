# This code is programmed in R v2.15.2.with iGraph v0.7.0 and netrw v0.2.6
# Homework 2 Question 3

# clearing workspace
closeAllConnections()
rm(list=ls())

# Load libraries
library("igraph")
library("netrw")

############################### Part a ###############################

# generate graph from 1a
num_nodes <- 1000
num_steps <- 1000
g1 <- erdos.renyi.game(n = num_nodes, p = 0.01 , directed = FALSE)
w_mat = netrw(g1, walker.num = num_nodes, damping = 1, T = num_steps, output.walk.path = TRUE) # get vertex sequence of random walk

visit_probability = w_mat$ave.visit.prob
g1_degree = degree(g1)

plot(g1_degree,visit_probability, main = "Visit Probability for Undirected Graph", xlab = "Degree", ylab = "Visiting Probability", ylim = c(0,.0025))

############################### Part b ###############################

g2 <-erdos.renyi.game(n = num_nodes, p = 0.01 , directed = TRUE)
w_mat2 = netrw(g2, walker.num = num_nodes, damping = 1, T = num_steps, output.walk.path = TRUE) # get vertex sequence of random walk


#Calculate the probability of visiting a node and it's in/out/total degree
visit_probability2 = w_mat2$ave.visit.prob
g2_idegree = degree(g2, mode = "in")
g2_odegree = degree(g2, mode = "out")
g2_totdegree = degree(g2, mode = "all")

#Plot the graphs of in/out/total degree versus visiting probability
plot(g2_idegree,visit_probability2, main = "Visit Probability for Directed Graph (In Degree)", xlab = "Degree", ylab = "Visiting Probability")
plot(g2_odegree,visit_probability2, main = "Visit Probability for Directed Graph (Out Degree)", xlab = "Degree", ylab = "Visiting Probability")
plot(g2_totdegree,visit_probability2, main = "Visit Probability for Directed Graph (All Degree)", xlab = "Degree", ylab = "Visiting Probability")


############################### Part C  ###############################

w_mat = netrw(g1, walker.num = num_nodes, damping = .85, T = num_steps, output.walk.path = TRUE) # get vertex sequence of random walk

visit_probability = w_mat$ave.visit.prob
g1_degree = degree(g1)

plot(g1_degree,visit_probability, main = "Visit Probability for Undirected Graph with Teleportation (damping = 0.85)", xlab = "Degree", ylab = "Visiting Probability", ylim = c(0,.0025) )


