

CREATE DATABASE vendor


CREATE TABLE vendor(
  id int(15) NOT NULL AUTO_INCREMENT,
  name varchar(30) DEFAULT NULL,
  purchaseOrderAvailable int(1) DEFAULT NULL,
  purchaseNumber  varchar(40) DEFAULT NULL,
  orderType int(11) NOT NULL DEFAULT 1,
  cost int(10),
  PRIMARY KEY (id)  
) ;
CREATE TABLE order_type (
  id int(11) NOT NULL,
  name varchar(30) DEFAULT NULL,
  PRIMARY KEY (id)
) ;



INSERT INTO vendor.order_type(id,name) VALUES(1,'Staff Augmentation');
INSERT INTO vendor.order_type(id,name) VALUES(2,'Outbound Projects');
INSERT INTO vendor.order_type(id,name) VALUES(3,'Software Licensing');
INSERT INTO vendor.order_type(id,name) VALUES(4,'Hardware Purchase');


