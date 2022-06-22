# Meal1
java / maven / mysql

admin 로그인관련 
admin
비밀번호 123




트리거   


drop trigger if exists buy_goods_trg;

delimiter //
create trigger buy_goods_trg
after insert
on order_tb
for each row
begin
update goods_tb set g_amount = g_amount-new.o_goods_qty where g_id= new.g_id;
end //
delimiter ;

use meal;
drop trigger if exists delete_cart_trg;

delimiter //
create trigger delete_cart_trg
after insert
on order_tb
for each row
begin
delete from cart_tb where u_id = new.u_id and g_id = new.g_id;
end //
delimiter ; 


DROP TRIGGER IF EXISTS ordermilageTrg ;
DELIMITER // 
CREATE TRIGGER ordermilageTrg -- 트리거 이름
AFTER INSERT -- 삭제 후 작동하도록 지정
ON order_tb -- 트리거를 부착할 테이블
FOR EACH ROW 
BEGIN 
INSERT INTO mileage VALUES(
m_id,
(new.o_goods_qty * new.o_goods_price) / 100,
current_timestamp(),
new.u_id,
new.o_id
);
 END // 
 DELIMITER ;


DROP TRIGGER IF EXISTS ordermilageuserTrg;
DELIMITER // 
CREATE TRIGGER ordermilageTrguser -- 트리거 이름
AFTER INSERT -- 삭제 후 작동하도록 지정
ON mileage -- 트리거를 부착할 테이블
FOR EACH ROW 
BEGIN 
update user_tb set u_mile = u_mile + new.m_point where U_id = new.U_id;
 END // 
 DELIMITER ;


DROP TRIGGER IF EXISTS orderusemilagerTrg;
DELIMITER // 
CREATE TRIGGER orderusemilagerTrg -- 트리거 이름
AFTER INSERT -- 삭제 후 작동하도록 지정
ON order_tb -- 트리거를 부착할 테이블
FOR EACH ROW 
BEGIN 
INSERT INTO mileage VALUES(
m_id,
-1 * new.o_useMile ,
current_timestamp(),
new.u_id,
new.o_id
);
 END // 
 DELIMITER ;
