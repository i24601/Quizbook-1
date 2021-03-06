--users
create table users(
    userNo number not null,
    id VARCHAR2(50) not null unique,
    firstName varchar2(50),
    lastName varchar2(50),
    nickName varchar2(50),
    password varchar2(50) not null,
    joinDate date not null,
    age number not null,
    userImg varchar2(500),
    userInfo varchar2(1000),
    email varchar2(100),
    gender varchar2(10),
    constraint users_pk primary key(userNo)
);

--folder
create table folder(
    folderNo number not null,
    userNo number not null,
    folderName varchar2(50) not null,
    groupNo number not null,
    rootNo number not null,
    orderNo number not null,
    depth number not null,
    regDate date not null,
    constraint folder_pk primary key(folderNo),
    constraint folder_fk foreign key(userNo) references users(userNo) on delete cascade
);

--sets
create table sets(
    setNo number not null,
    folderNo number not null,
    userNo number not null,
    setName varchar2(50) not null,
    setExplain varchar2(1000),
    regDate date not null,
    setImg varchar2(500),
    tag varchar2(100),
    setlike number,
    setdislike number,
    constraint sets_pk primary key(setNo),
    constraint sets_fk_folderNo foreign key(folderNo) references folder(folderNo) on delete cascade,
    constraint sets_fk_userNo foreign key(userNo) references users(userNo) on delete cascade
);

--word
create table word(
    wordNo number not null,
    setNo number not null,
    word varchar2(500),
    meaning varchar2(500),
    wordImg varchar2(500),
    orderNo number not null,
    constraint word_pk primary key(wordNo),
    constraint word_fk_setNo foreign key(setNo) references sets(setNo) on delete cascade
);

--sequence
create sequence seq_user_no start with 1 increment by 1;
create sequence folderNo start with 1 increment by 1;
create sequence setNo start with 1 increment by 1;
create sequence wordNo start with 1 increment by 1;

--insert user
insert into users values(1, '123', '��', '����', '�贩��', '1234', sysdate, 26, 'peng.png', '', '', '');
insert into users values(2, '456', '��', '����', '�贩��2', '1234', sysdate, 26, '', '', '', '');

--insert basic folder
insert into folder values(folderNo.nextval, 1, '�� ����', folderNo.nextval, 0, 1, 0, sysdate);
insert into folder values(folderNo.nextval, 2, '�� ����', folderNo.nextval, 0, 1, 0, sysdate);

--select
select *
from users;

select *
from folder;

select * 
from sets;

select * 
from word;

--drop table and sequence

drop table users;
drop table folder;
drop table sets;
drop table word;

drop sequence seq_user_no;
drop SEQUENCE folderNo;
drop SEQUENCE setNo;
drop SEQUENCE wordNo;

--test
update users
set userImg = 'peng.png'
where userno = 1;

insert into word values(wordNo.nextval, 1, 'kim', 'nuri', 'asdfasdfasdfasdf', 1);

select *
from word
where setNo = 9
order by dbms_random.value;

--�������� 10�� ���
select *
from (select *
      from word
      where setNo = 9
      order by dbms_random.value)
where rownum <= 10;















