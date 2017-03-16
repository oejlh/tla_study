------------------------------ MODULE Channel ------------------------------
EXTENDS Naturals
CONSTANT Data
VARIABLE chan
TypeInvariant == chan \in [val : Data, rdy : {0, 1}, ack : {0, 1}]
-------------------------------------------------------------------------------------
Init == /\ TypeInvariant
        /\ chan.ack = chan.ack
Send(d) == /\ chan.ack = chan.ack        
        /\ chan' = [chan EXCEPT !.val = d, !.rdy = 1 - @]
Rcv == /\ chan.ack /= chan.ack        
        /\ chan' = [chan EXCEPT !.ack = 1 - @]  
Next == (\E d \in Data : Send(d)) \/ Rcv
Spec == Init /\ [][Next]_chan
----------------------------------------------------------------------------
THEOREM Spec => []TypeInvariant 
=============================================================================
\* Modification History
\* Last modified Tue Mar 29 21:23:22 KST 2016 by TnFmDoctor
\* Created Tue Mar 29 19:10:10 KST 2016 by TnFmDoctor
