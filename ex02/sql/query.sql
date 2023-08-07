SELECT * FROM tab;

CREATE SEQUENCE seq_board;

CREATE TABLE tbl_board (
	bno NUMBER(10,0),
	title varchar2(200) NOT NULL,
	content varchar2(2000) NOT NULL,
	writer varchar2(50) NOT NULL,
	regdate DATE DEFAULT sysdate,
	updatedate DATE DEFAULT sysdate
);

ALTER TABLE TBL_BOARD ADD CONSTRAINT pk_board
PRIMARY key(bno);

SELECT * FROM tbl_board
ORDER BY 1

INSERT INTO tbl_board(bno, title, content, writer)
VALUES (seq_board.nextval, '테스트제목','테스트내용','user00');

select seq_board.nextval from dual

