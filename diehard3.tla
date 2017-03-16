------------------------------ MODULE diehard3 ------------------------------
EXTENDS Naturals
VARIABLE small, big
TypeOK == small \in 0..3 /\ big \in 0..5
------------------

Init == /\ small = 0
        /\ big = 0



EmptySmall == small' = 0 /\ UNCHANGED big \* big' = big
EmptyBig == big' = 0 /\ UNCHANGED small \* small' = small
FillSmall == small' = 3 /\ UNCHANGED big
FillBig == big' = 5 /\ UNCHANGED small

Small2Big == \/ (big + small > 5 /\ big' = 5 /\ small' = small - (5 - big))
             \/ (big + small <= 5 /\ big' = big + small /\ small' = 0)
Big2Small == \/ (big + small > 3 /\ small' = 3 /\ big' = big - (3 - small))
             \/ (big + small <= 3 /\ small' = big + small /\ big' = 0)

Next == \/ EmptySmall \/ EmptyBig \/ FillSmall \/ FillBig \/ Small2Big \/ Big2Small

Spec == Init /\ [][Next]_<<big,small>>
--------------------
THEOREM Spec => []TypeOK
=============================================================================
\* Modification History
\* Last modified Thu Mar 16 22:25:14 KST 2017 by hlee
\* Created Thu Mar 16 17:35:30 KST 2017 by hlee
