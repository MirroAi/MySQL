  http://blog.sina.com.cn/s/blog_767d65530101861c.html
  
  查询语句练习题
  1.建表
  create table student(
  id int(10) primary key not null auto_increment,
  name varchar(20) not null,
  sex varchar(4),
  birth year,
  department varchar(20) not null,
  address varchar(50)
  )default charset=utf8;
  
  create table score(
  id int(10) primary key not null auto_increment,
  stu_id int(10) not null,
  c_name varchar(20),
  grade int(10)
  )default charset=utf8;
  
  2.插入数据
  insert into student values(901,'张老大','男',1990,'计算机系','北京市海淀区');
  insert into student (name,sex,birth,department,address) values
  ('张老二','男',1991,'中文系','北京市昌平区'),
  ('张三','女',1995,'中文系','湖南省永州市'),
  ('李四','男',1995,'英语系','辽宁省阜新市'),
  ('王五','女',1996,'英语系','福建省厦门市'),
  ('王六','男',1993,'计算机系','湖南省衡阳市');
  
  insert into score values(NULL,901,'计算机',98);
  insert into score (stu_id,c_name,grade) values
  (901,'英语',80),
  (902,'计算机',65),
  (902,'中文',88),
  (903,'中文',95),
  (904,'计算机',70),
  (904,'英语',92),
  (905,'英语',94),
  (906,'计算机',90),
  (906,'英语',85);
  
  3.查询student表的所有记录
  select * from student;
  
  4.查询student表的第2条到第4条记录
  select * from student limit 1,3;
  
  5.从student表查询所有学生的学号、姓名和院系信息
  select id,name,department from student;
  
  6.从student表中查询计算机系和英语系的学生的信息
  select *
  from student
  where department in ('计算机系','英语系');
  
  7.从student表中查询年龄18~22岁的学生信息
  select *
  from student
  where 2018-birth between 18 and 22;
  
  8.从student表中查询每个院系有多少人
  select department,count(department)
  from student
  group by department;
  
  9.从score表中查询每个科目的最高分
  select c_name,max(grade)
  from score
  group by c_name;
  
  10.查询李四的考试科目和考试成绩
  select c_name,grade
  from score
  where stu_id in (select id from student where name='李四');
  
  11.用连接的方式查询所有学生的信息和考试信息
  select a.*,b.c_name,b.grade
  from student a,score b
  where a.id=b.stu_id
  order by a.id;
  
  12.计算每个学生的总成绩
  select stu_id,count(c_name),sum(grade)
  from score
  group by stu_id;
  
  13.计算每个考试科目的平均成绩
  select c_name,avg(grade)
  from score
  group by c_name;
  
  14.查询计算机成绩低于95的学生信息
  select *
  from student
  where id in (select stu_id from score where c_name='计算机' and grade<95);
  
  15.查询同时参加计算机和英语考试的学生的信息
  select *
  from student
  where id in (select a.stu_id from score a,score b where a.stu_id=b.stu_id and a.c_name='计算机' and b.c_name='英语');
  
  16.将计算机考试成绩按从高到低排序
  select stu_id,grade
  from score
  where c_name='计算机'
  order by grade desc;
  
  17.从student表和score表中查询出学生的学号，然后合并查询结果
  select id from student
  union
  select stu_id from score;
  
  18.查询姓张或者姓王的同学的姓名、院系和考试科目及成绩
  select a.name,a.department,b.c_name,b.grade
  from student a,score b
  where a.id=b.stu_id and a.name regexp '^[张王]';
  题意 张、王必须为姓，即以其中之一开头
  
  19.查询都是湖南的学生的姓名、年龄、院系和考试科目及成绩
  select a.name,2018-a.birth as age,a.department,b.c_name,b.grade
  from student a,score b
  where a.id=b.stu_id and a.address regexp '^湖南';