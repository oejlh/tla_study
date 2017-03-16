----------------------------- MODULE HourClock2 -----------------------------
EXTENDS HourClock
HCnxt2  ==  hr' = (hr % 12) + 1
HC2  ==  HCini /\ [][HCnxt2]_hr
-----------------------------------------------------------------------------
THEOREM  HC <=> HC2
=============================================================================
\* Modification History
\* Last modified Fri Apr 15 22:02:03 KST 2016 by TnFmDoctor
\* Created Fri Apr 15 22:01:24 KST 2016 by TnFmDoctor
