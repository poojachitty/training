DECLARE @NAME VARCHAR(50),@SALARY INT
SELECT
@NAME=ENAME,@SALARY=SAL*12 FROM EMP WHERE EMPNO=7369
PRINT @NAME
PRINT @SALARY






SELECT * FROM EMP