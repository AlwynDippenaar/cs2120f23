theorem and_comm {P Q : Prop} : (P ∧ Q → Q ∧ P) ∧ (Q ∧ P → P ∧ Q) :=
And.intro (λ ⟨p,q⟩ => ⟨q,p⟩) (λ ⟨q,p⟩ => ⟨p,q⟩)
