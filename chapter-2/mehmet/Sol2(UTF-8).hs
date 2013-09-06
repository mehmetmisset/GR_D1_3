﻿-- ╔════════╤═════════════════════════════════════════════════════════════════╗
-- ║ Modele │ TAMO T-alking A-bout M-athematical O-bjects                     ║
-- ║        │     (CH 2 of book - The Haskell Road to Logic)                  ║
-- ╠════════╪═════════════════════════════════════════════════════════════════╣
-- ║ Auteur │ Mehmet Misset                                                   ║
-- ║ Date   │ 6-9-2013                                                        ║
-- ╚════════╧═════════════════════════════════════════════════════════════════╝
-- ─│┌┐└┘├┤┬┴┼═║╒╓╔╕╖╗╘╙╚╛╜╝╞╟╠╡╢╣╤╥╦╧╨╪╫╬

module TAMO

where
-- use hugs -98
-- or use ghci -XFlexibleInstances

-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║ Imports                                                                  ║
-- ╚══════════════════════════════════════════════════════════════════════════╝


-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║ 2.1 Logical Connectives and their Meanings                               ║
-- ╚══════════════════════════════════════════════════════════════════════════╝

-- ╔═════════════════╤════════╤═════════════╗
-- ║                 │ Symbol │ Name        ║
-- ╠═════════════════╪════════╪═════════════╣
-- ║ and             │   Λ    │ Conjunction ║
-- ╟─────────────────┼────────┼─────────────╢
-- ║ or              │   V    │ Disjunction ║
-- ╟─────────────────┼────────┼─────────────╢ 
-- ║ not             │   ¬    │ Negation    ║
-- ╟─────────────────┼────────┼─────────────╢
-- ║ if──then        │  ==>   │ Implication ║
-- ╟─────────────────┼────────┼─────────────╢
-- ║ if, and only if │  <=>   │ Equivalence ║
-- ╚═════════════════╧════════╧═════════════╝

-- ╔═══════════╗
-- ║ Negation  ║
-- ║ not       ║
-- ╠═════╤═════╣
-- ║  P  │ ¬P  ║
-- ╠═════╪═════╣
-- ║  T  │  F  ║
-- ╟─────┼─────╢
-- ║  F  │  T  ║
-- ╚═════╧═════╝

-- ╔═══════════════════╗
-- ║ Conjunction       ║
-- ║ &&                ║
-- ╠═════╤═════╤═══════╣
-- ║  P  │  Q  │ P Λ Q ║
-- ╠═════╪═════╪═══════╣
-- ║  T  │  T  │   T   ║
-- ╟─────┼─────┼───────╢
-- ║  T  │  F  │   F   ║
-- ╟─────┼─────┼───────╢
-- ║  F  │  T  │   F   ║
-- ╟─────┼─────┼───────╢
-- ║  F  │  F  │   F   ║
-- ╚═════╧═════╧═══════╝

-- ╔═══════════════════╗
-- ║ Disjunction       ║
-- ║ ||                ║
-- ╠═════╤═════╤═══════╣
-- ║  P  │  Q  │ P V Q ║
-- ╠═════╪═════╪═══════╣
-- ║  T  │  T  │   T   ║
-- ╟─────┼─────┼───────╢
-- ║  T  │  F  │   T   ║
-- ╟─────┼─────┼───────╢
-- ║  F  │  T  │   T   ║
-- ╟─────┼─────┼───────╢
-- ║  F  │  F  │   F   ║
-- ╚═════╧═════╧═══════╝

-- ╔════════════════════╗
-- ║ if──then           ║
-- ║ ==>                ║
-- ╠═════╤═════╤════════╣
-- ║  P  │  Q  │ P => Q ║
-- ╠═════╪═════╪════════╣
-- ║  T  │  T  │   T    ║
-- ╟─────┼─────┼────────╢
-- ║  T  │  F  │   F    ║
-- ╟─────┼─────┼────────╢
-- ║  F  │  T  │   T    ║
-- ╟─────┼─────┼────────╢
-- ║  F  │  F  │   T    ║
-- ╚═════╧═════╧════════╝
infix 1 ==>
(==>) :: Bool -> Bool -> Bool
x ==> y = (not x) || y

-- ╔═════════════════════╗
-- ║ if, and only if     ║
-- ║ <=>                 ║
-- ╠═════╤═════╤═════════╣
-- ║  P  │  Q  │ P <=> Q ║
-- ╠═════╪═════╪═════════╣
-- ║  T  │  T  │   T     ║
-- ╟─────┼─────┼─────────╢
-- ║  T  │  F  │   F     ║
-- ╟─────┼─────┼─────────╢
-- ║  F  │  T  │   F     ║
-- ╟─────┼─────┼─────────╢
-- ║  F  │  F  │   T     ║
-- ╚═════╧═════╧═════════╝
infix 1 <=>
(<=>) :: Bool -> Bool -> Bool
x <=> y = x == y

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ Exercise 2.2: truth table of exclusice version of or                     │
-- └──────────────────────────────────────────────────────────────────────────┘
-- Don't get this, my swag is not (P V Q) this would result in the table below
-- ╔══════════════════════╗ swag=scientific wild ass guess
-- ║ Disjunction          ║
-- ║ not (P || Q)         ║
-- ╠═════╤═════╤══════════╣
-- ║  P  │  Q  │ ¬(P V Q) ║
-- ╠═════╪═════╪══════════╣
-- ║  T  │  T  │   F      ║
-- ╟─────┼─────┼──────────╢
-- ║  T  │  F  │   F      ║
-- ╟─────┼─────┼──────────╢
-- ║  F  │  T  │   F      ║
-- ╟─────┼─────┼──────────╢
-- ║  F  │  F  │   T      ║
-- ╚═════╧═════╧══════════╝

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ Exercise 2.4: check truth table of exclusice version of or to  ¬(P<=>Q)  │
-- └──────────────────────────────────────────────────────────────────────────┘
-- Don't get this, my swaq is, but must be doning something wrong
-- ╔══════════════════════╗
-- ║ ¬(P<=>Q)             ║
-- ╠═════╤═════╤══════════╣
-- ║  P  │  Q  │ ¬(P<=>Q) ║
-- ╠═════╪═════╪══════════╣
-- ║  T  │  T  │    F     ║
-- ╟─────┼─────┼──────────╢
-- ║  T  │  F  │    T     ║
-- ╟─────┼─────┼──────────╢
-- ║  F  │  T  │    T     ║
-- ╟─────┼─────┼──────────╢
-- ║  F  │  F  │    T     ║
-- ╚═════╧═════╧══════════╝
infix 1 <+>
(<+>) :: Bool -> Bool -> Bool
x <+> y = x /= y



-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ Formula1                                                                 │
-- └──────────────────────────────────────────────────────────────────────────┘

p = True
q = False

formula1 = (not p) && (p ==> q) <=> not (q && ( not p))

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ Formula2                                                                 │
-- └──────────────────────────────────────────────────────────────────────────┘

formula2 p q = ((not p) && (p ==> q) <=> not (q && ( not p)))

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ Valid1                                                                   │
-- └──────────────────────────────────────────────────────────────────────────┘

valid1 :: (Bool -> Bool) -> Bool
valid1 bf = (bf True) && (bf False)

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ Excluded Middle                                                          │
-- └──────────────────────────────────────────────────────────────────────────┘

excluded_middle :: Bool -> Bool
excluded_middle p = p || not p

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ Valid2                                                                   │
-- └──────────────────────────────────────────────────────────────────────────┘

valid2 :: (Bool -> Bool -> Bool) -> Bool
valid2 bf = (bf True  True )
         && (bf True  False)
         && (bf False True )
         && (bf False False)

form1 p q = p ==> (q ==> p)
form2 p q = (p ==> q) ==> p

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ Example 2.6:The first law of De Morgan                                   │
-- └──────────────────────────────────────────────────────────────────────────┘

-- ┌──────────────────────────────┐
-- │ ¬ (P  Λ  Q)  (¬  P  V  ¬  Q) │
-- ├──────────────────────────────┤
-- │ F  T  T  T    F  T  F  F  T  │
-- │ T  T  F  F    F  T  T  T  F  │
-- │ T  F  F  T    T  F  T  F  T  │
-- │ T  F  F  T    T  F  T  T  F  │
-- └──────────────────────────────┘

-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║ 2.2 Logical Validity And Related Notations                               ║
-- ╚══════════════════════════════════════════════════════════════════════════╝

class TF p where 
  valid :: p -> Bool
  lequiv :: p -> p -> Bool

instance TF Bool
 where
  valid  = id
  lequiv f g = f == g

instance TF p => TF (Bool -> p)
 where
  valid f = valid (f True) && valid (f False)
  lequiv f g = (f True) `lequiv` (g True)
               && (f False) `lequiv` (g False)

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ Exercise 2.11: Tests                                                     │
-- └──────────────────────────────────────────────────────────────────────────┘

test1  = lequiv id (\ p -> not (not p))

test2a = lequiv id (\ p -> p && p) 
test2b = lequiv id (\ p -> p || p) 

test3a = lequiv    (\ p q ->      p ==> q ) (\ p q -> not p ||     q)
test3b = lequiv    (\ p q -> not (p ==> q)) (\ p q ->     p && not q)

test4a = lequiv    (\ p q -> not p ==> not q) (\ p q ->     q ==>     p)
test4b = lequiv    (\ p q ->     p ==> not q) (\ p q ->     q ==> not p)
test4c = lequiv    (\ p q -> not p ==> q)     (\ p q -> not q ==>     p)

test5a = lequiv    (\ p q ->  p <=> q) 
                   (\ p q -> (p ==> q) && (    q ==>    p))
test5b = lequiv    (\ p q ->  p <=> q) 
                   (\ p q -> (p &&  q) || (not p && not q))

test6a = lequiv    (\ p q -> p && q) (\ p q -> q && p)
test6b = lequiv    (\ p q -> p || q) (\ p q -> q || p)

test7a = lequiv    (\ p q -> not (p &&     q)) 
                   (\ p q -> not  p || not q)
test7b = lequiv    (\ p q -> not (p ||     q)) 
                   (\ p q -> not  p && not q)

test8a = lequiv    (\ p q r ->  p && (q  && r)) 
                   (\ p q r -> (p &&  q) && r)
test8b = lequiv    (\ p q r ->  p || (q  || r)) 
                   (\ p q r -> (p ||  q) || r)

test9a = lequiv    (\ p q r ->  p && (q  ||       r)) 
                   (\ p q r -> (p &&  q) || (p && r))
test9b = lequiv    (\ p q r ->  p || (q  &&       r)) 
                   (\ p q r -> (p ||  q) && (p || r))

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ Theorem: 2.12/Exercise 2.13:                                             │
-- └──────────────────────────────────────────────────────────────────────────┘

-- From earlier
-- p = True  => T
-- q = False => F

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ Dominace Laws                                                            │
-- │ ¬T ≡ F                                                                   │
-- │ ¬F ≡ T                                                                   │
-- │ P ==> F ≡ ¬P                                                             │
-- │ P V T ≡ T                                                                │
-- │ P Λ F ≡ F                                                                │
-- └──────────────────────────────────────────────────────────────────────────┘
test_2_12_1a = (not True) == False
test_2_12_1b = (not False) == True
test_2_12_2 = (p ==> False) == (not p)
test_2_12_3a = (p || True ) == True 
test_2_12_3b = (p && False) == False 

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ Identity Laws                                                            │
-- │ P V F ≡ P                                                                │
-- │ P Λ T ≡ P                                                                │
-- └──────────────────────────────────────────────────────────────────────────┘
test_2_12_4a = (p || False) == p 
test_2_12_4b = (p && True ) == p 

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ Excluded Middle Laws                                                     │
-- │ P V ¬P ≡ T                                                               │
-- └──────────────────────────────────────────────────────────────────────────┘
test_2_12_5 = (p || (not p)) == True

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ Contradiction                                                            │
-- │ P Λ ¬P ≡ F                                                               │
-- └──────────────────────────────────────────────────────────────────────────┘
test_2_12_6 = (p && (not p)) == False















