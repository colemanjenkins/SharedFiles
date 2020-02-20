namespace hidden

--α is an argument to the function of what type the list is
inductive list_poly (α: Type)
| nil {}: list_poly
| cons (h : α)(t : list_poly) : list_poly

def l1 := list_poly.cons 5 list_poly.nil

def fib : ℕ → ℕ 
| 0 := 0
| 1 := 1
| (n'' + 2) := (fib n'') + fib (n'' + 1)

#eval fib 33


def equals : ℕ → ℕ → bool
| 0 0 := true
| _ 0 := false
| 0 _ := false
| (nat.succ n') (nat.succ m') := equals n' m'

#eval equals 7 7 

def sub : ℕ → ℕ → ℕ 
| 0 0 := 0
| n 0 := n
| 0 n := 0
| (nat.succ n') (nat.succ m') := sub n' m'

end hidden

/-
1. Write type of function without thinking of implementation
2. Write test cases

-/

