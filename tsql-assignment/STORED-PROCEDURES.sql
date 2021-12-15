CREATE PROCEDURE HELLO
AS
BEGIN
  PRINT 'HELLO'
END


CREATE PROCEDURE SAYHELLO(@NAME VARCHAR(5))
AS
BEGIN
  PRINT 'HELLO '+ @NAME
END


EXECUTE SAYHELLO 'POOJA'



alter procedure SAYHELLO(@No int)
as
begin
print 'Hello World ' + cast(@No as varchar)
end


exec SAYHELLO 123

CREATE PROCEDURE GETEMPNAMEBYEMPNO (@EMPNO INT)
AS 
BEGIN
   DECLARE @NAME VARCHAR(50)
  SELECT
	@NAME=ENAME FROM EMP WHERE @EMPNO=EMPNO
	PRINT @NAME
END

EXEC GETEMPNAMEBYEMPNO 7369
 
 --1
ALTER PROCEDURE ANNUALSALARY(@EMPNO INT)
AS
BEGIN
DECLARE @SALARY INT
SELECT
SAL*12 FROM EMP WHERE @EMPNO=EMPNO
PRINT @SALARY
END

EXEC ANNUALSALARY 7369

--2 Create SP which accepts empno and display his/her Job

ALTER PROCEDURE JOBBYEMPNO(@EMPNO INT)
AS
BEGIN
DECLARE @JOB VARCHAR(100)
SELECT @JOB =JOB
FROM EMP 
WHERE EMPNO=@EMPNO
PRINT @JOB
END

EXEC JOBBYEMPNO 7369

--3 Create SP which accepts deptno and display how many emps are working
ALTER PROCEDURE NOOFEMP(@DEPTNO INT)
AS
BEGIN
DECLARE @NOEMP INT
SELECT @NOEMP=COUNT(DEPTNO) 
FROM EMP 
WHERE DEPTNO=@DEPTNO
PRINT @NOEMP
END

EXEC NOOFEMP 30


SELECT * FROM EMP

--4 Create SP which accepts empno and display his/her mgr name

ALTER PROCEDURE MANAGERNAME(@EMPNO INT)
AS
BEGIN
DECLARE @MGR varchar(10)
SELECT @MGR=ENAME FROM EMP WHERE EMPNO = (Select MGR FROM EMP Where EMPNO = @EMPNO)
PRINT @MGR
END

EXEC MANAGERNAME 7369

--5
create procedure GetEmpDetailsbyEmpno(@empno int)
as
begin
select empno,ENAME, job,deptno from emp where empno=@empno
end



exec GetEmpDetailsbyEmpno 7499



select * from emp

SELECT * FROM DEPT

CREATE PROCEDURE AddNewDeptDetails(@DEPTNO INT,@DNAME VARCHAR(14),@DLOC VARCHAR(13))
AS
BEGIN
INSERT INTO DEPT VALUES(@DEPTNO,@DNAME,@DLOC)
END

EXEC AddNewDeptDetails 50,'D&A','BNG'


CREATE PROCEDURE RemoveDeptDeatils(@DEPTNO int)
as
BEGIN
DELETE FROM DEPT WHERE @DEPTNO=DEPTNO
END

EXEC RemoveDeptDeatils 50
SELECT * FROM EMP

--UPDATE
CREATE PROCEDURE NewSalary(@EMPNO INT,@SALARY INT)
AS
BEGIN
UPDATE EMP
SET SAL=@SALARY
WHERE EMPNO=@EMPNO
END

EXEC NewSalary 7369,800


---stored procedure for output parameters

select * from emp

create procedure GetEmpCountbyDeptno
@Deptno int,
@EmpCount int output
as
begin
select @EmpCount=COUNT(Empno) from emp where DEPTNO=@Deptno
end



declare @TotalCount int
execute GetEmpCountbyDeptno 10,@TotalCount output
print @TotalCount