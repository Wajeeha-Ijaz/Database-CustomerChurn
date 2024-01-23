################################################################
## What is the distribution of customers based on tenure groups?
################################################################

SELECT count(customer_ID) as cust_count,
	CASE
		WHEN tenure < 20 THEN '0-20 Years'
        WHEN tenure BETWEEN 21 AND 40 THEN '21-40 Years'
        WHEN tenure BETWEEN 41 AND 60 THEN '41-60 years'
        ELSE 'above 60 years'
	END as tenure_groups
FROM customer
GROUP BY tenure_groups
ORDER BY tenure_groups DESC;

###############################################################################
## Analyze churn rate by different demographics (gender, senior citizen, etc.). 
###############################################################################

SELECT count(b.churn) as churn, c.Gender,c.SeniorCitizen,c.tenure
FROM billing b
JOIN customer c
ON c.customer_ID=b.customer_ID
WHERE churn = 'yes'
group by c.Gender, c.SeniorCitizen, c.tenure
order by 2 DESC;

###########################################################
## Identify the services most used by customers who churned.
###########################################################

SELECT s.customer_ID,b.churn,s.OnlineBackup,s.OnlineSecurity,s.DeviceProtection,s.TechSupport,s.StreamingTV,s.StreamingMovies,s.MultipleLines
FROM services s
JOIN billing b
ON b.customer_ID=s.customer_ID
WHERE InternetServices NOT LIKE '%no%'
    AND OnlineBackup NOT LIKE '%no%'
    AND OnlineSecurity NOT LIKE '%no%'
    AND DeviceProtection NOT LIKE '%no%'
    AND TechSupport NOT LIKE '%no%'
    AND StreamingTV NOT LIKE '%no%'
    AND StreamingMovies NOT LIKE '%no%'
    AND MultipleLines NOT LIKE '%no%'
    AND b.churn LIKE "yes"
GROUP BY s.customer_ID,b.churn,s.OnlineBackup,s.OnlineSecurity,s.DeviceProtection,s.TechSupport,s.StreamingTV,s.StreamingMovies,s.MultipleLines;

########################################################
## Discover patterns related to payment method and churn
########################################################

SELECT p.PaymentMethod,count(b.churn) as churn_count
FROM payments p
JOIN billing b
ON b.customer_ID=p.customer_ID
WHERE b.churn LIKE "yes"
GROUP BY p.PaymentMethod
ORDER BY churn_count DESC;


