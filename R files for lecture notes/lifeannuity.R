# Function to calculate fair value of a life annuity
calculate_fair_annuity <- function(mortality_table, discount_rate, annuitant_age) {
  
  # Extract relevant mortality rates for insured's age and policy term
  # Note that observation t+1 is required for age t
  mortality_rates <- mortality_table$qx[(annuitant_age + 1):120]
  
  # Calculate survival probabilities as 1 minus the cumulative mortality rates
  survival_probs <- cumprod(1 - mortality_rates)
  #note no shift by 1 because you must survive a year to collect first payment
  
  # Calculate expected cash flows as $1 million times the probability of dying in the subsequent year, adjusted for survival probabilities
  annuity_factor <- sum(survival_probs / (1 + discount_rate)^(1:(120-annuitant_age)))
  
  return(annuity_factor)
}

