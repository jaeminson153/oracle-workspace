/*===============================
���̺� ���� ����
CREATE TABLE table_name(
  column_name datatype,
  column_name datatype
);

�ڷ���(datatype)
varchar2 - �������� ���ڸ� ����
char - �������� ���ڸ� ����
number(m)-��������
number(m,n)- �Ǽ�����
date - ��¥ ����
===============================*/
CREATE TABLE student(
  name varchar2(20), --����Ʈ(����,Ư������- 1byte / �ѱ�-3byte)
  age number(3),   --�ڸ���
  avg number(5,2), --5�� ��ü�ڸ���, 2�� �Ҽ��� �ڸ���
  hire date  
);

insert into student(name, age,avg, hire) values('ȫ�浿',30, 297.8512, sysdate);

select * from student;