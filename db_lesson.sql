DB lesson section10

Q1.
create table departments(
  department_id int unsigned NOT NULL AUTO_INCREMENT primary key,
  name varchar(20) NOT NULL,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP
);

Q2.
alter table people add department_id int unsigned after email;

Q3.
追加（departments）
insert into departments(name)
values
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

追加（people）
insert into people(name,email,department_id,age,gender)
values
('大木ゆう','ooki@beyond-works.co.jp','1',40,1),
('内藤まさあき','naitou@beyond-works.co.jp','2',25,1),
('金原あきこ','kanehara@beyond-works.co.jp','3',32,2),
('数寄屋かほ','suukiya@beyond-works.co.jp','1',31,2),
('岩瀬つとむ','iwase@beyond-works.co.jp','2',23,1),
('田野せいじ','tano@beyond-works.co.jp','2',28,1),
('長嶋ひろふみ','nagasima@beyond-works.co.jp','1',37,1),
('阿久津なつみ','akutu@beyond-works.co.jp','2',25,2),
('戸部やえ','tobe@beyond-works.co.jp','4',44,2),
('大杉かなみ','oosugi@beyond-works.co.jp','5',26,2);

追加（reports）
insert into reports(person_id,content)
VALUES
(7,'本日の天気：晴れ　新規：1件　継続：5件'),
(9,'本日の天気：曇り　新規：2件　継続：9件'),
(11,'本日の天気：雪　新規：1件　継続：8件'),
(14,'本日の天気：晴れ　新規：4件　継続：7件'),
(16,'本日の天気：晴れ　新規：1件　継続：6件'),
(8,'本日の天気：曇り　新規：3件　継続5件'),
(10,'本日の天気：雨　新規：1件　継続：4件'),
(12,'本日の天気：雨　新規：2件　継続：3件'),
(13,'本日の天気：曇り　新規：5件　継続：5件'),
(15,'本日の天気：快晴　新規：1件　継続：2件');

Q4.
UPDATE people SET department_id = 2 WHERE department_id IS NULL;

Q5.
select name,age from people WHERE gender = 1 ORDER BY age DESC;

Q6.
'people'というテーブルの
'name(名前)'、'email(eメール)'、'age(年齢)'というカラムの内容を
'department_id'の値が1と一致するレコードに絞って
レコードの作成順に並べて確認する

Q7.
select name, age ,gender
from people WHERE gender = 2 AND 20 <= age AND age < 30 OR gender =1 AND 40 <= age AND age < 50 ORDER BY age;

Q8.
select p.name,p.age,d.name from departments d join people p USING(department_id) WHERE d.department_id = 1 ORDER BY age;

Q9.
select AVG(age) AS average_age from people WHERE gender =2 GROUP BY gender;

Q10.
select p.name,d.name,r.content
from people p join departments d USING(department_id) right Join reports r USING(person_id);

Q11.
select p.name,r.content
from people p left outer Join reports r USING(person_id) WHERE content is NULL; 