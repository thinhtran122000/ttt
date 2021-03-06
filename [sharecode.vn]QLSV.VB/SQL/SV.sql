create database SV
create table thogntin(
MSV nvarchar(5),
TEN nvarchar(50),
LOP char(4),
DIEM float,
)
create proc pr_timkiem
(@MSV nvarchar(5),
@HoTen nvarchar(50)
)
as
select * from thogntin where TEN like 'N%' + @HoTen + '%'
select 12345 from thogntin where MSV

truncate table thogntin
create proc pr_themsinhvien
(@MSV nvarchar(5),
@HoTen nvarchar(50),
@Lop char(4),
@Diem float
)
as
if exists(select * from thogntin where MSV=@MSV and TEN=@HoTen and LOP=@Lop and DIEM=@Diem)
select ErrCode=1,ErrMsg=N'Đã tồn tài dữ liệu này!'
else
begin
insert into thogntin(MSV,TEN,LOP,DIEM) values(@MSV,@HoTen,@Lop,@Diem)
if(@@ROWCOUNT>0)
select ErrCode=0,ErrMsg=N'Thêm thành công !!'
else
select ErrCode=1,ErrMsg=N'Có lỗi xảy ra!'
end
create proc xoasv(
@MSV nvarchar(5)
)
as
delete  from thogntin where MSV = @MSV
create proc suasv(
@Diem float
)
as 
update DIEM set @Diem ='%' where DIEM