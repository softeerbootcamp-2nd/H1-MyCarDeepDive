LOAD DATA INFILE '/var/lib/mysql/mycar_db/recommendation_car.csv'
INTO TABLE recommendation_car
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql/mycar_db/recommendation_car_option.csv'
INTO TABLE recommendation_car_option
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql/mycar_db/recommendation_car_package.csv'
INTO TABLE recommendation_car_package
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
--
INSERT INTO recommendation (recommendation_id, age_group_id, comment1, comment2, description, keyword, life_style_id, recommendation_car_id) VALUES (1, 1, '가족을 생각하는 당신을 위한 팰리세이드', '우리 아이들과 함께 타는 차는 항상 안전해야 한다고 생각해요', NULL, '가족', 1, 1);
INSERT INTO recommendation (recommendation_id, age_group_id, comment1, comment2, description, keyword, life_style_id, recommendation_car_id) VALUES (2, 1, '가족을 생각하는 당신을 위한 팰리세이드', '우리 아이들과 함께 타는 차는 항상 안전해야 한다고 생각해요', NULL, '가족', 2, 2);
INSERT INTO recommendation (recommendation_id, age_group_id, comment1, comment2, description, keyword, life_style_id, recommendation_car_id) VALUES (3, 1, '가족을 생각하는 당신을 위한 팰리세이드', '우리 아이들과 함께 타는 차는 항상 안전해야 한다고 생각해요', NULL, '가족', 3, 3);
INSERT INTO recommendation (recommendation_id, age_group_id, comment1, comment2, description, keyword, life_style_id, recommendation_car_id) VALUES (4, 1, '가족을 생각하는 당신을 위한 팰리세이드', '우리 아이들과 함께 타는 차는 항상 안전해야 한다고 생각해요', NULL, '가족', 4, 4);
INSERT INTO recommendation (recommendation_id, age_group_id, comment1, comment2, description, keyword, life_style_id, recommendation_car_id) VALUES (5, 2, '가족을 생각하는 당신을 위한 팰리세이드', '우리 아이들과 함께 타는 차는 항상 안전해야 한다고 생각해요', NULL, '가족', 1, 5);
INSERT INTO recommendation (recommendation_id, age_group_id, comment1, comment2, description, keyword, life_style_id, recommendation_car_id) VALUES (6, 2, '가족을 생각하는 당신을 위한 팰리세이드', '우리 아이들과 함께 타는 차는 항상 안전해야 한다고 생각해요', NULL, '가족', 2, 1);
INSERT INTO recommendation (recommendation_id, age_group_id, comment1, comment2, description, keyword, life_style_id, recommendation_car_id) VALUES (7, 2, '가족을 생각하는 당신을 위한 팰리세이드', '우리 아이들과 함께 타는 차는 항상 안전해야 한다고 생각해요', NULL, '가족', 3, 2);
INSERT INTO recommendation (recommendation_id, age_group_id, comment1, comment2, description, keyword, life_style_id, recommendation_car_id) VALUES (8, 2, '가족을 생각하는 당신을 위한 팰리세이드', '우리 아이들과 함께 타는 차는 항상 안전해야 한다고 생각해요', NULL, '가족', 4, 3);
INSERT INTO recommendation (recommendation_id, age_group_id, comment1, comment2, description, keyword, life_style_id, recommendation_car_id) VALUES (9, 3, '가족을 생각하는 당신을 위한 팰리세이드', '우리 아이들과 함께 타는 차는 항상 안전해야 한다고 생각해요', NULL, '가족', 1, 4);
INSERT INTO recommendation (recommendation_id, age_group_id, comment1, comment2, description, keyword, life_style_id, recommendation_car_id) VALUES (10, 3, '가족을 생각하는 당신을 위한 팰리세이드', '우리 아이들과 함께 타는 차는 항상 안전해야 한다고 생각해요', NULL, '가족', 2, 5);
INSERT INTO recommendation (recommendation_id, age_group_id, comment1, comment2, description, keyword, life_style_id, recommendation_car_id) VALUES (11, 3, '가족을 생각하는 당신을 위한 팰리세이드', '우리 아이들과 함께 타는 차는 항상 안전해야 한다고 생각해요', NULL, '가족', 3, 1);
INSERT INTO recommendation (recommendation_id, age_group_id, comment1, comment2, description, keyword, life_style_id, recommendation_car_id) VALUES (12, 3, '가족을 생각하는 당신을 위한 팰리세이드', '우리 아이들과 함께 타는 차는 항상 안전해야 한다고 생각해요', NULL, '가족', 4, 2);
INSERT INTO recommendation (recommendation_id, age_group_id, comment1, comment2, description, keyword, life_style_id, recommendation_car_id) VALUES (13, 4, '가족을 생각하는 당신을 위한 팰리세이드', '우리 아이들과 함께 타는 차는 항상 안전해야 한다고 생각해요', NULL, '가족', 1, 3);
INSERT INTO recommendation (recommendation_id, age_group_id, comment1, comment2, description, keyword, life_style_id, recommendation_car_id) VALUES (14, 4, '가족을 생각하는 당신을 위한 팰리세이드', '우리 아이들과 함께 타는 차는 항상 안전해야 한다고 생각해요', NULL, '가족', 2, 4);
INSERT INTO recommendation (recommendation_id, age_group_id, comment1, comment2, description, keyword, life_style_id, recommendation_car_id) VALUES (15, 4, '가족을 생각하는 당신을 위한 팰리세이드', '우리 아이들과 함께 타는 차는 항상 안전해야 한다고 생각해요', NULL, '가족', 3, 5);
INSERT INTO recommendation (recommendation_id, age_group_id, comment1, comment2, description, keyword, life_style_id, recommendation_car_id) VALUES (16, 4, '가족을 생각하는 당신을 위한 팰리세이드', '우리 아이들과 함께 타는 차는 항상 안전해야 한다고 생각해요', NULL, '가족', 4, 1);
--