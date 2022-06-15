# псевдоязык
parents:
id: int
name: varchar
created_at: datetime

# Rails
# a)
Student.where.not(parent_id: nil).count
# b)
Student.joins(:parents).where('parents.name = ?', 'Marina').count
# c)
Student.where(parent_id: nil).count

# SQL
# a)
SELECT parent_id FROM students
WHERE COUNT(parent_id != NULL)
# b)
SELECT sudents.id, parents.id, parents.name
FROM students
INNER JOIN parents ON sudents.id = parents.id
WHERE COUNT(parents.name = 'Marina')
# c)
SELECT parent_id FROM students
WHERE COUNT(parent_id = NULL)

# Scope
# b)
belongs_to :parent

scope :join_parents, -> (name) {
  joins(:parent).where('parents.name = ?', name)
}

# b)
def self.students_with_parent_name(name)
  join_parents(name).count
end
