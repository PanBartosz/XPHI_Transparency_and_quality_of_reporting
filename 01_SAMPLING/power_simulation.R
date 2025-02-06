i <- 10000 # number of repetitions for each simulations

complement <- function(y, rho, x) {
  if (missing(x)) x <- rnorm(length(y)) # Optional: supply a default if `x` is not given
  y.perp <- residuals(lm(x ~ y))
  rho * sd(y.perp) * y + y.perp * sd(y) * sqrt(1 - rho^2)
}

simulate_model <- function(n, rho){
  # simulating year of publication date
  period1year = sample(1:3, n, replace = T)
  period2year = sample(1:3 + 3, n, replace = T)
  period3year = sample(1:3 + 6, n, replace = T)
  period4year = sample(1:3 + 9, n, replace = T)
  period5year = sample(1:3 + 12, n+30, replace = T)
  year = c(period1year, period2year, period3year, period4year, period5year)
  response = rnorm(n*5 + 30)
  # drawing correlation coefficient assuming that rho is true correlation
  sig <- rnorm(1, rho, 1/sqrt((5*n+30)-3))
  r <- DescTools::FisherZInv(sig)
  response <- complement(year, r, response)
  # simulated data
  sim_sample <- data.frame(response = response, year = year)
  model <- lm(response ~ year, data = sim_sample)
  pval <- summary(model)$coefficients[2, 4]
  pval
}

pvals <- replicate(i, simulate_model(35, 0.2))

sum(pvals < 0.05)/i
library(pwr)
pwr.r.test(n=NULL, r = 0.2, power = 0.80)

