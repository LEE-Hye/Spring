create table board
(
	idx int auto_increment,
	title varchar(100) not null,
	writer varchar(100) not null,
	content varchar(1000) not null,
	indate datetime default now(),
	count int default 0,
	
	primary key(idx)
);

insert into board(title, writer, content)
values ('스프링','이혜빈','스프링 게시판 만들기');
insert into board(title, writer, content)
values ('감자스프링','삼혜빈','감자스프링 게시판 만들기');
insert into board(title, writer, content)
values ('옥수수스프링','사혜빈','옥수수스프링 게시판 만들기');

select * from board;