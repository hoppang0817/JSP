USE JSPBookDB;
-- AUTO_INCREMENT: 자동으로 1씩증가 
-- IF NOT EXISTS : member테이블이 없다면 생성
CREATE TABLE IF NOT EXISTS member(
   id int NOT NULL AUTO_INCREMENT,
   passwd  VARCHAR(20),
   name VARCHAR(30),    
   PRIMARY KEY (id)
);
