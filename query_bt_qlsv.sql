#Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT * FROM Student
WHERE Student.StudentName LIKE 'h%';

#Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.

#Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ.
SELECT *
FROM class 
where month(class.StartDate)=12;

#Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
SELECT *
FROM subject
where subject.Credit BETWEEN 3 AND 5;

#Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student set classid=2 where StudentName='Hung';
select * from student;
#Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select student.StudentName, subject.SubName, mark.mark from student join mark on student.StudentId=mark.StudentId
join subject on mark.SubId=subject.SubId
order by Mark DESC,StudentName ASC;
