# Housing Price Regression

Multiple linear regression analysis of 545 housing listings to identify what drives sale price, with full assumption testing and correction.

## Overview

This project doesn't just fit a regression — it checks whether the model is actually valid. It builds a price model from property characteristics, tests all five core linear regression assumptions, finds that most of them are violated, and applies a transformation to fix it.

## Objectives

- Build a multiple linear regression model explaining price from area, bedrooms, bathrooms, stories, and parking
- Test the model against the core linear regression assumptions
- Correct assumption violations and validate the improved model

## Dataset

545 housing listings with price, area, bedrooms, bathrooms, stories, and parking capacity.

## Tools & Technologies

R (car, ggplot2, MASS, psych)

## Methodology

- Descriptive statistics and skewness assessment for price and predictors
- Correlation matrix/heatmap to check predictor relationships and screen for multicollinearity
- Full multiple linear regression (Price ~ Area + Bedrooms + Bathrooms + Stories + Parking)
- Stepwise variable selection (AIC) to test for a more parsimonious model
- Assumption diagnostics: Residuals-vs-Fitted, Durbin-Watson, Q-Q plot, Shapiro-Wilk, VIF
- Log transformation of price to correct assumption violations, with re-testing

## Key Insights

- Area (r = 0.54) and Bathrooms (r = 0.52) show the strongest correlation with price; the full model explains 55.75% of price variance (Adjusted R² = 0.5575)
- The initial model violated 4 of 5 regression assumptions: linearity, homoscedasticity, independence (Durbin-Watson = 1.089), and normality (Shapiro-Wilk p ≈ 4.85e-10)
- All VIF values were below 1.4 — no multicollinearity issue
- A log transformation of price fixed the homoscedasticity, linearity, and normality violations (Shapiro-Wilk W = 0.9937); independence remained violated, likely due to spatial correlation not captured in the data

## Results / Outcome

The final log-linear model explains ~54% of variance in log-price (R² ≈ 0.54) and satisfies all key assumptions except independence of errors. Area and bathrooms are confirmed as the strongest price drivers, with a recommendation to add location data in future work to resolve the remaining autocorrelation.

## Project Structure

```
housing-price-regression/
├── README.md
├── data/
│   └── Housing_Price_Data.csv
├── scripts/
│   └── housing_price_regression.R
└── report/
    └── regression.docx
```

The R script was extracted directly from the final report's "Appendix A: R Inputs & Outputs" section. Only the dataset file path was updated to match this repository's structure; the analysis logic is unchanged.

## Skills Demonstrated

Statistical Analysis, Regression Modeling, Assumption Testing & Diagnostics, Data Transformation, Data Visualization
