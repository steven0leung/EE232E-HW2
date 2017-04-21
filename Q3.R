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

plot(g1_degree,visit_probability, main = "Visit Probability for Undirected Graph", xlab = "Degree", ylab = "Visiting Probability")

############################### Part b ###############################


num_nodes <- 1000
num_steps <- 1000
g1 <-random.graph.game(n = num_nodes, p = 0.01 , directred = TRUE)
w_mat = netrw(g1, walker.num = num_nodes, damping = 1, T = num_steps, output.walk.path = TRUE) # get vertex sequence of random walk

visit_probability = w_mat$ave.visit.prob
g1_degree = degree(g1,mode = "out")

plot_data = rbind(g1_degree, visit_probability)
plot_data = plot_data[,order(plot_data[1,])]  #order by degree
plot(plot_data[1,], plot_data[2,], xlab = "In-Degree", ylab = "Visit Probability", main = "Relation Between In Degree and Visit Probability for Directed Network")


plot(g1_degree,visit_probability, main = "Visit Probability for Directed Graph", xlab = "Degree", ylab = "Visiting Probability")
