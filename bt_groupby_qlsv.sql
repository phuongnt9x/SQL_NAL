#Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from subject 
where credit=(Select Max(credit) from subject);
#Hiển thị các thông tin môn học có điểm thi lớn nhất
select * from subject
where subid=(select subid from mark
where Mark=(select max(Mark) from mark));

#Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.StudentId, s.StudentName, s.Address, s.Phone,  AVG(Mark) from student as s
join mark as m on s.StudentId = m.StudentId 
group by s.StudentId