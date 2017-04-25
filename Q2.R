# This code is programmed in R v3.3.3.with iGraph v1.0.1
# Homework 2 Question 2

# clearing workspace
closeAllConnections()
rm(list=ls())

# Load libraries
library("igraph")


############################## Part a ##############################

num_steps <- 50  # number of steps the walker takes
num_nodes <- 1000 # number of nodes

# generate random graph
g1 <- barabasi.game(n = num_nodes, directed = FALSE)


############################## Part b ##############################


# compuete distances between every node
distance_matrix <- shortest.paths(g1, v = V(g1), to = V(g1))

avg_distance <- numeric()
avg_std <- numeric()
w_mat <- numeric()
dist_array <- numeric()

# Create random walk matrix
for (i in 1:num_nodes){
  w_struct <- random_walk(g1,start = i, steps = num_steps)
  w_mat <- cbind(w_mat,as_ids(w_struct))
}

# Perform avg distance & std calculations
for (i in 1:(num_steps-1)) {
  distance_sum <- 0
  dist_array <- 0
  for (j in 1:num_nodes) {
    current_distance <- distance_matrix[w_mat[1,j],w_mat[i+1,j]]
    if (current_distance == Inf) {
      current_distance = 0
    }
    distance_sum <- distance_sum + current_distance
    dist_array = c(dist_array,current_distance)
  }
  avg_distance <- c(avg_distance,distance_sum/num_nodes)
  avg_std <- c(avg_std, mean((dist_array - mean(dist_array))**2))
  
}

# Plot avg distance and std
plot(avg_distance , type = "b", main = "Average Distance (n=1,000)" , ylab = "Distance" ,xlab = "Steps")
plot(avg_std , type = "b'" , main = "STD (n=1,000)", ylab = "STD" ,xlab = "Steps")

deg_g1 <- degree(g1)
diameter_g1 = diameter(g1)
sprintf("Diameter of network with n = 1,000 is : %i", diameter_g1)

############################## Part e  ##############################
deg_end_walk = degree(g1 , v = w_mat[ 30, ])

hist( x= deg_g1, breaks = seq(from = min(deg_g1), to = max(deg_g1), by=1), main = "Degree Distribution for Graph (n=1,000 & p=0.01)", xlab = "Degree", ylab = "Frequency")
hist( x= deg_end_walk, breaks = seq(from = min(deg_end_walk), to = max(deg_end_walk), by=1), main = "Degree Distribution at End of Random Walk (n=1,000 & p=0.01)", xlab = "Degree", ylab = "Frequency")


############################## Part d with n = 100 ##############################
# clear workspace
rm(list=ls())

# for n = 100
num_steps <- 50  # number of steps the walker takes
num_nodes <- 100 # number of nodes

# generate random graph
  g2 <- barabasi.game(n = num_nodes, directed = FALSE)

# compuete distances between every node
distance_matrix <- shortest.paths(g2, v = V(g2), to = V(g2))

avg_distance <- numeric()
avg_std <- numeric()
w_mat <- numeric()
dist_array <- numeric()

# Create random walk matrix
for (i in 1:num_nodes){
  w_struct <- random_walk(g2,start = i, steps = num_steps)
  w_mat <- cbind(w_mat,as_ids(w_struct))
}

# Perform avg distance & std calculations
for (i in 1:(num_steps-1)) {
  distance_sum <- 0
  dist_array <- 0
  for (j in 1:num_nodes) {
    current_distance <- distance_matrix[w_mat[1,j],w_mat[i+1,j]]
    if (current_distance == Inf) {
      current_distance = 0
    }
    distance_sum <- distance_sum + current_distance
    dist_array = c(dist_array,current_distance)
  }
  avg_distance <- c(avg_distance,distance_sum/num_nodes)
  avg_std <- c(avg_std, mean((dist_array - mean(dist_array))**2))
  
}

# Plot avg distance and std
plot(avg_distance , type = "b", main = "Average Distance (n=100)" , ylab = "Distance" ,xlab = "Steps")
plot(avg_std , type = "b'" , main = "STD (n=100)", ylab = "STD" ,xlab = "Steps")

deg_g2 <- degree(g2)
diameter_g2 = diameter(g2)
sprintf("Diameter of network with n = 100 is : %i", diameter_g2)

##############################  Part d with n= 10,000 ############################## 

# clear workspace
rm(list=ls())

# for n = 100
num_steps <- 30  # number of steps the walker takes
num_nodes <- 10000 # number of nodes

# generate random graph
g3 <- barabasi.game(n = num_nodes, directed = FALSE)

# compuete distances between every node
distance_matrix <- shortest.paths(g3, v = V(g3), to = V(g3))

avg_distance <- numeric()
avg_std <- numeric()
w_mat <- numeric()
dist_array <- numeric()

# Create random walk matrix
for (i in 1:num_nodes){
  w_struct <- random_walk(g3,start = i, steps = num_steps)
  w_mat <- cbind(w_mat,as_ids(w_struct))
}

# Perform avg distance & std calculations
for (i in 1:(num_steps-1)) {
  distance_sum <- 0
  dist_array <- 0
  for (j in 1:num_nodes) {
    current_distance <- distance_matrix[w_mat[1,j],w_mat[i+1,j]]
    if (current_distance == Inf) {
      current_distance = 0
    }
    distance_sum <- distance_sum + current_distance
    dist_array = c(dist_array,current_distance)
  }
  avg_distance <- c(avg_distance,distance_sum/num_nodes)
  avg_std <- c(avg_std, mean((dist_array - mean(dist_array))**2))
  
}

# Plot avg distance and std
plot(avg_distance , type = "b", main = "Average Distance (n=10,000)" , ylab = "Distance" ,xlab = "Steps")
plot(avg_std , type = "b'" , main = "STD (n=10,000)", ylab = "STD" ,xlab = "Steps")

deg_g3 <- degree(g3)
diameter_g3 = diameter(g3)
sprintf("Diameter of network with n = 10,000 is : %i", diameter_g3)

