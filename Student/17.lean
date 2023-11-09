/-!
# Curry-Howard Correspondence
-/

/-!
# Empty ==> False
-/

#check Empty

-- inductive Empty: Type

inductive Chaos : Type

def from_empty (e : Empty) : Chaos := nomatch e

#check False
-- inductive False : Prop
-- types like bool are computational objects,
-- but in Prop, we think of the values as proofs

def from_false {P : Prop} (p : False) : P := False.elim p

def from_false_true_is_false (p : False) : True = False := False.elim p

/-!
# Unit ==> True
-/

#check True.intro

-- False has no intro rule
-- True has no elim rule

def proof_of_true : True := True.intro

def false_implies_true : False → True := λ f => False.elim f

#check And

/-!
And is constructed with intro, where left arg is proof of a
and right arg is proof of b
-/

inductive birds_chirping : Prop
| yep
| boo

inductive sky_blue : Prop
| yep

#check (And birds_chirping sky_blue)

theorem both_and : And birds_chirping sky_blue := And.intro birds_chirping.yep sky_blue.yep

/-!
Proof irrelevance
-/

namespace cs2120f23
inductive Bool : Type
| true
| false

theorem proofs_equal : birds_chirping.boo = birds_chirping.yep := by trivial


-- in Prop, all proofs are equivalent
-- choice of proofs in Prop can't influence computations

/-!
Sum ==> Or
-/

#check Sum

#check Or

theorem one_or_other : Or birds_chirping sky_blue := Or.inl birds_chirping.boo
theorem one_or_other' : Or birds_chirping sky_blue := Or.inr sky_blue.yep

example : Or birds_chirping (0=1) := Or.inl birds_chirping.boo
-- example : (0=1) ∨ (1=2) := Or.inl _

theorem or_comm {P Q : Prop} : P ∨ Q → Q ∨ P :=
λ d => match d with
| Or.inl p => Or.inr p
| Or.inr q => Or.inl q

/-!
Not (no)
-/

def no (α : Type) := α → Empty

#check Not
-- Not P is defined to be P → False

example : no Chaos := λ (c : Chaos) => nomatch c

inductive Raining : Prop

example : ¬Raining := λ (r : Raining) => nomatch r
