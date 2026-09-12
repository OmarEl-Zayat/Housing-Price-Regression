# Regression Analysis of Housing Price Determinants
# Extracted from the project's final report (Appendix A: R Inputs & Outputs).
# Only the dataset file path below was changed from the original local path
# to match this repository's structure. No analysis logic was altered.

Housing_Price_Data_used <- read.csv("data/Housing_Price_Data.csv")

View(Housing_Price_Data_used)

# Load necessary libraries
library(car)
library(ggplot2)
library(MASS)
library(psych)

#load data
data <- read.csv("data/Housing_Price_Data.csv")

#data summary
summary(data)
describe(data)

# Calculate correlation matrix
cor_matrix = cor(data)

# Print correlation matrix
print(cor_matrix)

# Visualize correlation matrix
corr_plot <- ggplot(data = as.data.frame(as.table(cor_matrix)),
                     aes(Var1, Var2, fill = Freq)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white",
                        midpoint = 0, limit = c(-1, 1), space = "Lab", name="Correlation") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, size = 12, hjust = 1)) +
  coord_fixed()

print(corr_plot)

#forming the multiple regression model
model_full <- lm(price ~ area + bedrooms + bathrooms + stories + parking, data = data)

# Summary of the full model
summary(model_full)

# Assumption 1: Linearity
# Assumption 3: Homoscedasticity
# Plot residuals vs fitted values
plot(model_full, which = 1)

# Assumption 2: Independence
# Durbin-Watson test
durbinWatsonTest(model_full)

# Assumption 4: Normality of residuals
# Q-Q plot
qqPlot(model_full, main="Q-Q Plot")

# Shapiro-Wilk test
shapiro.test(model_full$residuals)

# Assumption 5: Multicollinearity
# Variance Inflation Factor (VIF)
vif(model_full)

# Stepwise selection
# Both directions (forward and backward)
stepwise_model <- stepAIC(model_full, direction = "both")

# Summary of the stepwise model
summary(stepwise_model)

data$log_price <- log(data$price) #transforming the price into log

# forming the log transformed model

model_log <- lm(log_price ~ area + bedrooms + bathrooms + stories + parking, data = data)

# Summary of the log model
summary(model_log)

# Assumption 1: Linearity
# Assumption 3: Homoscedasticity
# Plot residuals vs fitted values
plot(model_log, which = 1)

# Assumption 2: Independence
# Durbin-Watson test
durbinWatsonTest(model_log)

# Assumption 4: Normality of residuals
# Q-Q plot
qqPlot(model_log, main="Q-Q Plot")

# Shapiro-Wilk test
shapiro.test(model_log$residuals)

# Assumption 5: Multicollinearity
# Variance Inflation Factor (VIF)
vif(model_log)

#sqrt transportation
data$sqrt_price <- sqrt(data$price)

#sqrt model
model_sqrt <- lm(sqrt_price ~ area + bedrooms + bathrooms + stories + parking, data = data)

#summary of the sqrt model
summary(model_sqrt)

# Assumption 1: Linearity
# Assumption 3: Homoscedasticity
# Plot residuals vs fitted values
plot(model_sqrt, which = 1)

# Assumption 2: Independence
# Durbin-Watson test
durbinWatsonTest(model_sqrt)

# Assumption 4: Normality of residuals
# Q-Q plot
qqPlot(model_sqrt, main="Q-Q Plot")

# Shapiro-Wilk test
shapiro.test(model_sqrt$residuals)

# Assumption 5: Multicollinearity
# Variance Inflation Factor (VIF)
vif(model_sqrt)
