pr_timkiem N'12345',N'x'
ALTER proc [dbo].[pr_timkiem]
(@HoTen nvarchar(50)
)
as
select * from thongtin where TEN like '%' + @HoTen + '%'