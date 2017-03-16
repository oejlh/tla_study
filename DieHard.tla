------------------------------ MODULE DieHard ------------------------------
EXTENDS Naturals
VARIABLES big, small
TypeOK == small \in 0..3 /\ big \in 0..5

Init == big = 0 /\ small = 0

FillSmall == small' = 3 /\ UNCHANGED big
FillBig == big' = 5 /\ UNCHANGED small
EmptySmall == small' = 0 /\ UNCHANGED big
EmptyBig == big' = 0 /\ UNCHANGED small
Small2Big == \/ (big + small > 5 /\ big' = 5 /\ small' = small - (5-big))
             \/ (big + small <= 5 /\ big' = big + small /\ small' = 0)
Big2Small == \/ (big + small > 3 /\ small' = 3 /\ big' = big - (3-small))
             \/ (big + small <= 3 /\ small' = big + small /\ big' = 0)
 
Min(m, n) == IF m < n THEN m ELSE n
Small2Big2 == big' = Min(big + small, 5) /\ small' = small - (big' - big)
Big2Small2 == small' = Min(big + small, 3) /\ big' = big - (small' - small)
             
Next == \/ FillSmall \/ FillBig 
        \/ EmptySmall \/ EmptyBig 
\*        \/ Small2Big \/ Big2Small   
        \/ Small2Big2 \/ Big2Small2
        
Spec == Init /\ [][Next]_<<big,small>>
-----------------------------------------------------------------------------
THEOREM Spec => []TypeOK         
=============================================================================
\* Modification History
\* Last modified Tue Mar 14 15:04:53 KST 2017 by root
\* Created Tue Mar 14 14:24:09 KST 2017 by root
