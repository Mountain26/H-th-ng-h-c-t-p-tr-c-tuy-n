CREATE TABLE Student (
  student_id INT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  date_of_birth DATE,
  email VARCHAR(120) NOT NULL UNIQUE
);

CREATE TABLE Instructor (
  instructor_id INT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE
);

CREATE TABLE Course (
  course_id INT PRIMARY KEY,
  course_name VARCHAR(120) NOT NULL,
  short_description VARCHAR(255),
  total_sessions INT NOT NULL CHECK (total_sessions > 0),
  instructor_id INT NOT NULL,
  CONSTRAINT fk_course_instructor
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

CREATE TABLE Enrollment (
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  enroll_date DATE NOT NULL,
  PRIMARY KEY (student_id, course_id),
  CONSTRAINT fk_enroll_student
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
  CONSTRAINT fk_enroll_course
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE Result (
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  mid_score DECIMAL(3,1) CHECK (mid_score BETWEEN 0 AND 10),
  final_score DECIMAL(3,1) CHECK (final_score BETWEEN 0 AND 10),
  PRIMARY KEY (student_id, course_id),
  CONSTRAINT fk_result_student
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
  CONSTRAINT fk_result_course
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO Student (student_id, full_name, date_of_birth, email) VALUES
(1, 'Nguyễn Văn A', '2003-05-12', 'vana@gmail.com'),
(2, 'Trần Thị B',  '2004-08-20', 'thib@gmail.com'),
(3, 'Lê Văn C',    '2003-11-02', 'vanc@gmail.com'),
(4, 'Phạm Minh D', '2004-02-18', 'minhd@gmail.com'),
(5, 'Hoàng Gia E', '2003-09-09', 'giae@gmail.com');

INSERT INTO Instructor (instructor_id, full_name, email) VALUES
(101, 'ThS. Đỗ Long',     'dolong@ptit.edu.vn'),
(102, 'ThS. Nguyễn Mai',  'nguyenmai@ptit.edu.vn'),
(103, 'ThS. Trần Sơn',    'transon@ptit.edu.vn'),
(104, 'ThS. Lê Hương',    'lehuong@ptit.edu.vn'),
(105, 'ThS. Phạm Khánh',  'phamkhanh@ptit.edu.vn');

INSERT INTO Course (course_id, course_name, short_description, total_sessions, instructor_id) VALUES
(201, 'Cơ sở dữ liệu',        'Thiết kế CSDL quan hệ và SQL', 12, 101),
(202, 'Lập trình Web',        'HTML/CSS/JS + Backend cơ bản', 15, 102),
(203, 'Cấu trúc dữ liệu',     'Danh sách, cây, đồ thị',       14, 103),
(204, 'Phân tích hệ thống',   'UML, SRS, Use case',           10, 104),
(205, 'Mạng máy tính',        'TCP/IP, Routing cơ bản',       11, 105);

INSERT INTO Enrollment (student_id, course_id, enroll_date) VALUES
(1, 201, '2025-01-05'),
(2, 202, '2025-01-07'),
(3, 203, '2025-01-08'),
(4, 204, '2025-01-09'),
(5, 205, '2025-01-05');

INSERT INTO Result (student_id, course_id, mid_score, final_score) VALUES
(1, 201, 7.5, 8.0),
(2, 202, 7.0, 9.0),
(3, 203, 5.5, 6.5),
(4, 204, 7.5, 8.5),
(5, 205, 8.5, 9.5);

UPDATE Student
SET email = 'levanc_new@gmail.com'
WHERE student_id = 3;

UPDATE Course
SET short_description = 'Web full-stack cơ bản: frontend + API + DB'
WHERE course_id = 202;

UPDATE Result
SET final_score = 9.5
WHERE student_id = 2
  AND course_id = 203;

DELETE FROM Enrollment
WHERE student_id = 4
  AND course_id = 205;

DELETE FROM Result
WHERE student_id = 4
  AND course_id = 205;

SELECT * FROM Student;
SELECT * FROM Instructor;
SELECT * FROM Course;
SELECT * FROM Enrollment;
SELECT * FROM Result;
