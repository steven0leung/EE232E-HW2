# This code is programmed in R v2.15.2.with iGraph v0.7.0 and netrw v0.2.6
# Homework 2 Question 4

# clearing workspace
closeAllConnections()
rm(list=ls())

# Load libraries
library("igraph")
library("netrw")

############################### Part a ###############################

g1 <- erdos.renyi.game(n = 1000, p = 0.01, directed = TRUE)
page_rank_1 <- netrw(g1, walker.num = 1000, damping = 0.85, T = 1000, output.walk.path = TRUE)$ave.visit.prob # get vertex sequence of random walk

############################### Part b/c ###############################

page_rank_2 <- netrw(g1, walker.num = 1000, damping = 0.85, T = 1000, output.walk.path = TRUE,teleport.prob = page_rank_1)$ave.visit.prob # get vertex sequence of random walk
plot(density(page_rank_1),col="red",xlab="Probability",ylab="Frequency",main="Distribution of Page Rank A & B")
lines(density(page_rank_2),col="blue")

plot(page_rank_1,page_rank_2,xlab="Page Rank A",ylab="Page Rank B",main="Page Rank A vs Page Rank B")
lines(c(0,.003),c(0,.003),type="b",col="red")


plot(page_rank_1, main = "Page Rank for Each Node (Part A)", ylab = "Page Rank", ylim = c(0,.003))
plot(page_rank_2, main = "Page Rank for Each Node (Part B)", ylab = "Page Rank", ylim = c(0,.003))
