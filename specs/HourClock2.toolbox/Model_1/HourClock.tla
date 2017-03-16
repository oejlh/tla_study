----------------------------- MODULE HourClock -----------------------------
EXTENDS Naturals
VARIABLE hr
HCini == hr \in (1 .. 12)
HCnxt == hr' = IF hr # 12 THEN hr + 1 ELSE 1
HC == HCini /\ [][HCnxt]_hr
----------------------------------------------------------------------------
THEOREM HC => []HCini
=============================================================================
\* Modification History
\* Last modified Fri Apr 15 14:41:15 KST 2016 by TnFmDoctor
\* Created Fri Mar 25 22:43:03 KST 2016 by TnFmDoctor
