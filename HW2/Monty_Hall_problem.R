
choices <- sample(1:3, 10000, replace=T)
rewards <- sample(1:3, 10000, replace=T)

p_stay <- 0
p_change <- 0

for(ind in 1:10000){
  choice <- choices[ind]
  reward <- rewards[ind]
  doors <- c(1,2,3)
  empty.doors <- doors[!doors %in% c(reward, choice)]
  # Remember: R's amazing feature (not a BUG!!!)
  # where sampling an element c(x) of len one is actually sampling 1:x
  if (length(empty.doors) > 1){
    empty.door <- sample(empty.doors, 1)
  }else{
    empty.door <- empty.doors
  }
  change <- doors[!doors %in% c(empty.door, choice)]
  print("")
  print(c("change: ", change))
  print(c("doors: ", doors[!doors %in% c(reward, choice)]))
  print(c("choice: ", choice))
  print(c("empty: ", empty.door))
  print(c("reward: ", reward))
  if(change == reward){
    p_change <- p_change + 1
  }  
}

p_change / 10000

