echo "use sham" > krish.sql
echo "old table"
echo "select * from Sailer;" >> krish.sql

echo "bid  |  sid  |  dor"
read bi
read si
read d
echo "insert into Reserve values('$bi','$si','$d');" >> krish.sql
echo "select * from Sailer;" >> krish.sql
sudo mysql -u root < krish.sql
echo "done"


/*use sham
insert into Reserve values('201','2','2020-03-03');
select * from Sailer;
sham.sql*/





/* output
  krish@krish-Lenovo-V110-15AST:~$ sh krish_sh.sh
old table
bid  |  sid  |  dor
202
6
2023-03-13
[sudo] password for krish: 
Sid	Sname	srating
111	kaushal	2
112	adesh	1
113	krishna	0
114	tushar	0
Sid	Sname	srating
111	kaushal	2
112	adesh	1
113	krishna	0
114	tushar	0
done
*/
