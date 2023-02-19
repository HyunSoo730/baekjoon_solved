SELECT MCDP_CD AS '진료과코드',
    COUNT(*) AS '5월예약건수'
FROM APPOINTMENT
WHERE YEAR(APNT_YMD) = 2022 AND MONTH(APNT_YMD) = 5
GROUP BY MCDP_CD
ORDER BY COUNT(MCDP_CD) ASC , MCDP_CD ASC