----------------------------- MODULE ExChapter3 -----------------------------
EXTENDS Naturals
VARIABLE hr
HCini == hr \in (1 .. 12)
HCnxt == hr' = IF hr # 12 THEN hr + 1 ELSE 1
HC == HCini /\ [][HCnxt]_hr
----------------------------------------------------------------------------
THEOREM HC => []HCini
=============================================================================
\* Modification History
\* Last modified Fri Apr 15 12:22:07 KST 2016 by TnFmDoctor
\* Created Tue Mar 29 19:27:26 KST 2016 by TnFmDoctor
