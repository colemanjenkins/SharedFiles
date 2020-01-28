def x := 1+2

#eval x

def z' : ℕ := (nat.zero : ℕ)
def z''  := (nat.zero : ℕ)
def z''' : ℕ := nat.zero
def z := 0

-- Function expression are terms that have types
#check band 
#check nat.add
#check string.append

-- Function application expressions are terms that have types
#check band tt tt
#check nat.add 2 3
#check string.append "I love " "logic!"

-- Function application expessions reduce to return values
#eval band tt tt
#eval nat.add 2 3
#eval string.append "I love " "logic!"

-- Lean strictly and statically enforces typing 
--Can't do these! 
#check band ff "Hi!"
#check nat.add 4 tt
#eval string.append "I love " 5 -- strange error, same problem

/- what type are its areguments 
what type are its return value -/

tt  tt  ff
tt  ff  ff

--data type dm_bool
--dm_tt
--dm_ff

inductive /-define new data type-/ dm_bool /-name-/: /-of type-/ Type /-type-/
--rules for building values of type
| /-rule-/ dm_tt /-name-/: /-of type-/ dm_bool 
| dm_ff : dm_bool

--every type comes with own namespace; namespace closed by default
--name of namespace is name of type
#check dm_bool.dm_tt

--OR

--not a bad idea to have them (namespace) closed in general
open dm_bool /-open namespace dm_bool-/
#check dm_bool.dm_tt

def b1 := dm_tt
def b2 := dm_ff

inductive day : Type
| sunday : day 
| monday : day
| tuesday : day 
| wednesday : day 
| thursday : day 
| friday : day 
| saturday : day 

--OR

inductive day2 : Type
| sun
| mon
| tues
| wed
| thurs
| fri
| sat

-- unary functions / operators

def n /-Ident-/: ℕ /-type-/:= 0 /-value-/
-- → is "\to" or "\imp"

def dm_not : dm_bool → dm_bool := 
    λ /- a function -/ /- that takes-/(/-argument-/b /- of type-/: dm_bool), /-and that returns-/
        match b with
        | dm_tt := dm_ff
        | dm_ff := dm_tt
        end
/-
  ARG     RES
---------------
dm_tt  |  dm_ff
---------------
dm_ff  |  dm_tt
---------------
-/