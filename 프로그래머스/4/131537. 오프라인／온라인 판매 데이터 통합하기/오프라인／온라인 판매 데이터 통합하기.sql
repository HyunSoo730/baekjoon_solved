# 온라인 상품 판매 정보 담은 ONLINE_SALE 테이블
# 오프라인 상품 판매 정보를 담은 OFFLINE_SALE 테이블

# 두 테이블에서 2022년 3월의 
# 오프라인 / 온라인 상품 판매 데이터의
# 판매 날짜, 상품ID, 유저ID, 판매량을 출력하기
# OFFLINE_SALE 테이블의 판매 데이터의 USER_ID 값은 NULL로 표시
# 결과는 판매일 기준 오름차순, 상품 ID 기준 오름차순, 유저ID 기준 오름차순

# -> 두 테이블 따로 생각해야함 -> UNION
WITH ONLINE_P AS (
    SELECT DATE_FORMAT(A.SALES_DATE, "%Y-%m-%d") as SALES_DATE, A.PRODUCT_ID, A.USER_ID, SUM(A.SALES_AMOUNT) AS SALES_AMOUNT
    FROM ONLINE_SALE A
    WHERE YEAR(A.SALES_DATE) = 2022 AND MONTH(A.SALES_DATE) = 3
    GROUP BY A.PRODUCT_ID, A.USER_ID, A.SALES_DATE
),
OFFLINE_P AS (
    SELECT DATE_FORMAT(B.SALES_DATE, "%Y-%m-%d") as SALES_DATE, B.PRODUCT_ID, NULL, SUM(B.SALES_AMOUNT) AS SALES_AMOUNT
    FROM OFFLINE_SALE B
    WHERE YEAR(B.SALES_DATE) = 2022 AND MONTH(B.SALES_DATE) = 3
    GROUP BY B.PRODUCT_ID, B.SALES_DATE
),
UNION_P AS (
    SELECT * FROM ONLINE_P
    UNION
    SELECT * FROM OFFLINE_P
)

SELECT * FROM UNION_P
ORDER BY SALES_DATE ASC, PRODUCT_ID ASC, USER_ID ASC
