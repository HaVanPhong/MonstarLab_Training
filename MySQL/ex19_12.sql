create database MonstarSQL

use MonstarSQL

create table Categories (
	category_id int not null auto_increment,
    category_name varchar(50) not null,
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp,
    primary key(category_id)
)

create table Companies (
	company_id bigint not null auto_increment,
    company_name varchar(50) not null,
    company_code varchar(50) not null unique,
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp,
    primary key(company_id)
)

create table Users(
	user_id bigint not null auto_increment,
    username varchar(16) not null unique,
    email varchar(50) not null unique,
    password varchar(10) not null,
    birthday date,
    image_url text,
    is_active boolean,
    role varchar(20),
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp,
    primary key(user_id)
)

create table Projects(
	project_id bigint not null auto_increment,
    project_name varchar(50) not null,
    projected_spend int,
    projected_variance int,
    revenue_recognised int,
    category_id int not null,
    company_id bigint not null,
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp,
    primary key(project_id),
    constraint fk_project_category foreign key(category_id) references Categories(category_id),
    constraint fk_project_company foreign key(company_id) references Companies(company_id) 
)

create table Project_User(
	project_user_id bigint not null auto_increment,
    project_id bigint not null,
    user_id bigint not null,
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp,
    primary key(project_user_id),
    constraint fk_project_user_user foreign key(user_id) references Users(user_id),
    constraint fk_project_user_project foreign key(project_id) references Projects(project_id)
)


insert into Users (username, email, password, birthday, image_url, is_active, role) 
	values  ('phong1', 'phong1@gmail.com', '123', '2001-04-13', 'abc.jpg', false, 'admin'),
			('phong2', 'phong2@gmail.com', '123', '2001-03-13', 'bbc.jpg', true, 'admin'),
            ('phong3', 'phong3@gmail.com', '123', '2001-02-13', 'cbc.jpg', true, 'user'),
            ('phong4', 'phong4@gmail.com', '123', '2001-01-13', 'dbc.jpg', false, 'user')
            
select *from Users

insert into Categories (category_name) values ('category1'),
											  ('category1'),
                                              ('category1'),
                                              ('category1'),
                                              ('category1')
                                              
select * from Categories

insert into Companies (company_name, company_code) values ('company1', '100'), ('company2', '200'), ('monstar-lab', '300')
 

select * from Companies


insert into Projects (project_name, projected_spend, projected_variance, revenue_recognised, category_id, company_id)
	values ('project1', 1000, 100, 900, 1, 1),
		   ('project2', 2000, 200, 900, 2, 1),
           ('project3', 3000, 300, 900, 1, 3),
           ('project4', 4000, 400, 900, 2, 3),
           ('project5', 5000, 500, 900, 3, 1)


select * from Projects


insert into Project_User (project_id, user_id) values (6,2), (7,1), (8,2), (9,2), (6,1), (10,2)

select *from Project_User

-- 3 Viết lệnh sql để có thể lấy thông tin những bản ghi của projects và số lượng user của mỗi projects đó (count user)

select *from Project_User

select Projects.project_id, project_name, count(user_id) as 'count user'
from Projects inner join Project_User on Projects.project_id= Project_User.project_id
group by project_id


-- 4 Viết lệnh sql để lấy ra danh sách các project của company có company_name = “monstar-lab” 
select * from Projects inner join Companies on Projects.company_id= Companies.company_id where company_name='monstar-lab'


-- 5 Viết lệnh sql lấy ra danh sách các công ty có project có project_spend > 100

select Companies.company_id, company_name, company_code from Companies inner join Projects on Companies.company_id=Projects.company_id 
where projected_spend>100 
group by Companies.company_id

-- Viết lệnh sql để lấy ra thông tin của user  tham gia vào projects
select u.user_id, username, email, birthday, image_url, role from Users u inner join Project_User pu on u.user_id= pu.user_id
group by user_id

-- 6 lấy ra danh sách project mà có số lượng user tham gia > 10 , sắp xếp số lượng user tham gia tăng dần
select p.project_id, project_name, count(user_id) as 'countuser' from Projects p inner join Project_User pu on p.project_id=pu.project_id 
group by p.project_id
having   countuser>1
order by countuser asc

-- 7  Xoá project mà chưa có user nào tham gia
insert into Projects (project_name, projected_spend, projected_variance, revenue_recognised, category_id, company_id)
	values ('project99', 99, 99, 99, 1, 1)
    
    
SET sql_safe_updates=0 
delete from Projects where project_id not in (select project_id from Project_User)

select *from Projects

-- 8 Viết lệnh SQL trả về thông tin id, project_name, revenue_status của các project. 
-- Trong đó revenue_status được tính như sau: 
-- nếu revenue_recognized > projected_spend thì trả về status = profit, 
-- nếu revenue_recognized = projected_spend thì trả về status = break even ngược lại thì status = loss 
select *from Projects

select project_id, project_name, if(revenue_recognised>projected_spend, 'profit', if (revenue_recognised=projected_spend,'break even','loss'))
as 'revenue_status' from Projects 

-- 9 Viết lệnh SQL thông kê tổng  doanh thu đạt đươc (revenue_recognized) của các dự án trong 1 tháng
select sum(revenue_recognised) as 'sum revenue recognised', month(updated_at) as 'month', year(updated_at) as 'year'
from Projects
group by month, year 









-- the end

