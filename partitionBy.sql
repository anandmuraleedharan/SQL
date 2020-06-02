WITH SOURCE AS (
	SELECT *, 
			ROW_NUMBER() OVER(
				PARTITION BY patient_id
			) AS record_num 
	FROM public."Patients"
)

SELECT patient_id, product_id, date FROM source WHERE record_num = 2;