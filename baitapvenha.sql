--Câu 1:
-- Tạo một thủ tục  có tên là proSalary  để xét thưởng cuối năm như sau: 
-- Nếu nhân viên làm trên : >= 9 năm thì hưởng lương là 12 tr 
-- Nếu làm trên 6 năm thì thưởng 8 tr
-- Nếu làm trên 4 năm thì thưởng 6 tr
-- Còn lại thì thưởng 5tr 
create procedure procSalary
as 
begin
 select first_name ,  last_name , (DATEDIFF(YEAR,hire_date,GETDATE())) AS years ,
case 
when (DATEDIFF(YEAR,hire_date,GETDATE())) >= 9 then 12000
when (DATEDIFF(YEAR,hire_date,GETDATE())) > 6 then 8000
when (DATEDIFF(YEAR,hire_date,GETDATE())) > 4 then 6000
else 5000
end as Tet_bonus FROM employees;
end;
go
procsalary
go
--câu 2:
-- Tạo Pro_SearchName
--  sau đó hiển thị toàn bộ thông tin của nhân viên đó
--  trong đó nối họ và tên  Firt_name + Last_name = Full_name 
create procedure PROC_SeachName(@first_name VARCHAR (20))
as
begin
    if not exists (select first_name from employees where first_name = @first_name)
       begin 
           print 'Nhan vien khong ton tai'
       end
    else
  begin
     select  CONCAT(first_name,' ',last_name) as full_name ,email,phone_number,hire_date,job_id,salary,department_id  from employees where first_name =@first_name
  end
end
go
 PROC_SeachName'Adam'
