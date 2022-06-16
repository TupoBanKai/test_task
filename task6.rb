# псевдоязык
studetns:
id: int
name: varchar
created_at: datetime
parent_id: int

# Rails:
# a)
Student.all.count
# b)
Student.where(name: "Ivan").count
# c)
datetime = Time.new(2020,9,1)
Student.where("created_at > ?", datetime).count

# SQL
# a)
SELECT COUNT(*) FROM students
# b)
SELECT COUNT(*) FROM students
WHERE name = "Ivan"
# c)
SELECT COUNT(*) FROM students
WHERE SUBSTRING(time, 1, 10) > "2020-09-01"
