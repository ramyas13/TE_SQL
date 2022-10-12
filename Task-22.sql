use TE

--1. Scalar Function with 2 parameters - any concept
create function Fn_Square(@a int,@b int)
returns int
as
begin
	return @a * @b
end

select dbo.Fn_Square(4,2) as Result

--2. Procedure with OUTPUT parameter
create procedure sp_Total(@totalsalemployee int OUTPUT)
as 
Begin
	Select @totalsalemployee=count(SID) from Students
End

Declare @Final int
exec sp_Total @Final OUTPUT
Print @Final

--3. Trigger to restrict DML access between 6:00PM to 10.00AM
create trigger trig_ger
on demo
FOR INSERT,DELETE,UPDATE
as
begin
	if (DATEPART(HH,GETDATE())>18 or DATEPART(HH,GETDATE())<10)
	BEGIN
		print 'Insertion,Deletion or Updation not possible between 6:00PM and 10AM'
		Rollback transaction
	END
end

select * from demo
delete from demo where TID=106

--4. Server-scope trigger to restrict DDL access
create trigger Trig
on ALL Server
For Create_Table, Alter_Table,Drop_Table
as
Begin
	Print 'DDL cannot be performed'
	Rollback Transaction
End

create table Assign
(AID int
);

--5. Working of explicit transaction with Save transaction
BEGIN TRANSACTION
	insert into Students values(10,'Jerry',110,'NULL');
	SAVE TRANSACTION transact
	delete from Students where SID=8;
	ROLLBACK TRANSACTION transact
COMMIT TRANSACTION

select * from Students

--6. Difference between throw and Raiserror in exception handling
create procedure sp_divide
@num1 int,
@num2 int
as
BEGIN	
	Declare @Result int
	SET @Result = 0
	BEGIN TRY
		BEGIN
			IF(@num2=0)
			--RAISERROR('Cannot Divide By Zero',2,3) -- We can either use ERROR_NUMBER() or ERROR_MESSAGE()
			THROW 50001,'Cannot Divide By Zero',1 -- ERROR_NUMBER() & ERROR_MESSAGE() & ERROR_STATE() & ERROR_SEVERITY() is 16 by default
			SET @Result=@num1/@num2
			PRINT 'Value is:' + CAST(@Result as varchar)
		END
	END TRY
	BEGIN CATCH
		PRINT ERROR_NUMBER()
		PRINT ERROR_MESSAGE()
		PRINT ERROR_SEVERITY()
		PRINT ERROR_STATE()		
	END CATCH
END

execute sp_divide 5,5 --Value is:1
execute sp_divide 2,0


