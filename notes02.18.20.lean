def fac : ℕ → ℕ 
| 0 := 1
| (n' + 1) := (n' + 1)*(fac n') --n' = n-1

inductive dm_list (α : Type)
| nil {} : dm_list
| cons (h: α)(t :dm_list) : dm_list

def length {α :Type} : dm_list α → ℕ 
| dm_list.nil := 0
| (dm_list.cons h t) := 1 + length t

def append {α : Type} : dm_list α → dm_list α → dm_list α 
| (dm_list.nil) l2 := l2
| (dm_list.cons h t) l2 := dm_list.cons h (append t l2)

def reverse {α : Type} : dm_list α → dm_list α 
| dm_list.nil := dm_list.nil
| (dm_list.cons h t) := (append (reverse t) (dm_list.cons h dm_list.nil))