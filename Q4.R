# This code is programmed in R v2.15.2.with iGraph v0.7.0 and netrw v0.2.6
# Homework 2 Question 4

# clearing workspace
closeAllConnections()
rm(list=ls())

# Load libraries
library("igraph")
library("netrw")


###################################### Part A ##############################################
num_nodes <- 1000
num_steps <- 1000
g1 <- erdos.renyi.game(n = num_nodes, p = 0.01 , directed = TRUE)
w_mat = netrw(g1, walker.num = num_nodes, damping = .85, T = num_steps, output.walk.path = TRUE) # get vertex sequence of random walk

page_rank = w_mat$ave.visit.prob

plot(page_rank, main = "Page Rank for each node", ylab = "Page Rank", ylim = c(0,.003))


###################################### Part B ##############################################


w_mat2 = netrw(g1, walker.num = num_nodes, damping = .85, T = num_steps, output.walk.path = TRUE, teleport.prob = page_rank) # get vertex sequence of random walk

page_rank2 = w_mat2$ave.visit.prob


plot(page_rank2, main = "Page Rank for each node", ylab = "Page Rank", ylim = c(0,.003))