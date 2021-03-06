USE [SV]
GO
/****** Object:  StoredProcedure [dbo].[pr_themsinhvien]    Script Date: 05/31/2018 22:07:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
select * from thongtin
truncate table thongtin
pr_themsinhvien 12345,N'Phan Ngọc Hùng',45,8.5
ALTER proc [dbo].[pr_themsinhvien]
(@MSV nvarchar(5),
@HoTen nvarchar(50),
@Lop char(4),
@Diem float
)
as
if exists(select * from thongtin where MSV=@MSV and TEN=@HoTen and LOP=@Lop and DIEM=@Diem)
select ErrCode=1,ErrMsg=N'Đã tồn tài dữ liệu này!'
else
begin
insert into thongtin(MSV,TEN,LOP,DIEM) values(@MSV,@HoTen,@Lop,@Diem)
if(@@ROWCOUNT>0)
select ErrCode=0,ErrMsg=N'Thêm thành công !!'
else
select ErrCode=1,ErrMsg=N'Có lỗi xảy ra!'
end