﻿* Encoding: UTF-8.
***********************************************************************
* Regression in SPSS
* Lion Behrens, Naomi Schalken and Rens van de Schoot 
* Syntax file
***********************************************************************

* Loading in data (fill in your own working directory).
GET DATA  /TYPE=TXT 
  /FILE="C:\your working directory\phd-delays.csv"    
  /DELCASE=LINE 
  /DELIMITERS=";" 
  /ARRANGEMENT=DELIMITED 
  /FIRSTCASE=2 
  /DATATYPEMIN PERCENTAGE=95.0 
  /VARIABLES= 
  B3_difference_extra AUTO 
  E4_having_child AUTO 
  E21_sex AUTO 
  E22_Age AUTO 
  E22_Age_Squared AUTO 
  /MAP. 
RESTORE. 
CACHE. 
EXECUTE.

* Descriptive Statistics. 
EXAMINE VARIABLES=B3_difference_extra E22_Age E22_Age_Squared
  /PLOT BOXPLOT STEMLEAF
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

* Multiple linear regression with default priors. 
BAYES REGRESSION B3_difference_extra WITH E22_Age E22_Age_Squared
  /CRITERIA CILEVEL=95 TOL=0.000001 MAXITER=2000
  /DESIGN COVARIATES=E22_Age E22_Age_Squared
  /INFERENCE ANALYSIS=BOTH
  /PRIOR TYPE=REFERENCE
  /ESTBF COMPUTATION=JZS COMPARE=NULL
  /PLOT COVARIATES=E22_Age_Squared E22_Age  INTERCEPT=FALSE ERRORVAR=FALSE BAYESPRED=FALSE.

* Multiple linear regression with user-specified priors 1.
BAYES REGRESSION B3_difference_extra WITH E22_Age E22_Age_Squared
  /CRITERIA CILEVEL=95 TOL=0.000001 MAXITER=2000
  /DESIGN COVARIATES=E22_Age E22_Age_Squared
  /INFERENCE ANALYSIS=BOTH
  /PRIOR TYPE=CONJUGATE SHAPEPARAM=2 SCALEPARAM=2 MEANVECTOR=-47 3 0 VMATRIX=153;0 0.4;0 0 0.1
  /ESTBF COMPUTATION=JZS COMPARE=NULL
  /PLOT COVARIATES=E22_Age_Squared E22_Age  INTERCEPT=TRUE ERRORVAR=TRUE BAYESPRED=TRUE.

* Multiple linear regression with user-specified priors 2.
BAYES REGRESSION B3_difference_extra WITH E22_Age E22_Age_Squared
  /CRITERIA CILEVEL=95 TOL=0.000001 MAXITER=2000
  /DESIGN COVARIATES=E22_Age E22_Age_Squared
  /INFERENCE ANALYSIS=BOTH
  /PRIOR TYPE=CONJUGATE SHAPEPARAM=2 SCALEPARAM=2 MEANVECTOR=-47 3 0 VMATRIX=153;0 1000;0 0 1000
  /ESTBF COMPUTATION=JZS COMPARE=NULL
  /PLOT COVARIATES=E22_Age_Squared E22_Age  INTERCEPT=TRUE ERRORVAR=TRUE BAYESPRED=TRUE.

* Multiple linear regression with user-specified priors 3.
BAYES REGRESSION B3_difference_extra WITH E22_Age E22_Age_Squared
  /CRITERIA CILEVEL=95 TOL=0.000001 MAXITER=2000
  /DESIGN COVARIATES=E22_Age E22_Age_Squared
  /INFERENCE ANALYSIS=BOTH
  /PRIOR TYPE=CONJUGATE SHAPEPARAM=2 SCALEPARAM=2 MEANVECTOR=-47 20 20 VMATRIX=153;0 0.4;0 0 0.1
  /ESTBF COMPUTATION=JZS COMPARE=NULL
  /PLOT COVARIATES=E22_Age_Squared E22_Age  INTERCEPT=TRUE ERRORVAR=TRUE BAYESPRED=TRUE.

* Multiple linear regression with user-specified priors 4.
BAYES REGRESSION B3_difference_extra WITH E22_Age E22_Age_Squared
  /CRITERIA CILEVEL=95 TOL=0.000001 MAXITER=2000
  /DESIGN COVARIATES=E22_Age E22_Age_Squared
  /INFERENCE ANALYSIS=BOTH
  /PRIOR TYPE=CONJUGATE SHAPEPARAM=2 SCALEPARAM=2 MEANVECTOR=-47 20 20 VMATRIX=153;0 1000;0 0 1000
  /ESTBF COMPUTATION=JZS COMPARE=NULL
  /PLOT COVARIATES=E22_Age_Squared E22_Age  INTERCEPT=TRUE ERRORVAR=TRUE BAYESPRED=TRUE.

