variable
  (Cat : Type)
  (Dog : Type)
  (Likes1 : Dog → Cat → Prop)
  (Likes2 : Dog → Dog → Prop)
  (Likes3 : Cat → Cat → Prop)

#check ∀ (d : Dog), ∃ (c : Cat) , Likes1 d c


variable
  (x y z : Dog)
  (pf1 : Likes2 x y)
  (pf2 : Likes2 y z)
  (pf : ∀ (d g w : Dog), Likes2 d g → Likes2 g w → Likes2 d w)

example : Likes2 x z := pf x y z pf1 pf2

#check ∀ (d g w: Dog), ((Likes2 d g) ∧ (Likes2 g w)) → (Likes2 d w)


#check ∀ (c d : Cat), (Likes3 c d) → (Likes3 d c)

#check ∀ (c : Cat), Likes3 c c

#check ∀ (c d : Cat), Likes3 c d

example : (∀ (c1 c2 : Cat), Likes3 c1 c2) → (c : Cat) → (d : Cat) → Likes3 c d
| a, w1, w2 => a w1 w2
