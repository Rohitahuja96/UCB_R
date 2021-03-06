#UCB

#Importing the dataset
dataset = read.csv('Ads_CTR_Optimisation.csv')

#Implementing UCB
d = 10
N = 10000
total_rewad = 0
number_of_selected = integer(d)
ads_selected = integer(0)
sums_of_rewards = integer(d)
for(n in 1:N){
  ad = 0
  max_upper_bound = 0
  for(i in 1:d){
    if(number_of_selected[i]>0){
      average_reward = sums_of_rewards[i]/number_of_selected[i]
      delta_i = sqrt(3 / 2 * log(n) / number_of_selected[i])
      upper_bound = average_reward + delta_i
    }
    else{
      upper_bound = 1e400
    }
    if(upper_bound > max_upper_bound){
      max_upper_bound = upper_bound
      ad = i
    }
  }
  ads_selected = append(ads_selected,ad)
  number_of_selected[ad] = number_of_selected[ad] + 1
  reward = dataset[n,ad]
  sums_of_rewards[ad] = sums_of_rewards[ad] + reward
  total_rewad = total_rewad + reward
}

#Visualising the result
hist(ads_selected,
     col = 'blue',
     main = 'Hist of ads sel',
     xlab = 'Ads',
     ylab = 'No of times each ad was sel')
