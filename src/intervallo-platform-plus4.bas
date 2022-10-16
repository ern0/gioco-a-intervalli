8000 rem clear screen, reset colors
8001 scnclr
8002 :
8100 rem reset colors
8101 color 4,7,1
8102 color 0,7,2
8103 :
8200 rem reset cursor color
8201 color 1,2,7
8202 return
8203 :
8500 rem initialize sound
8501 poke 65297,7
8502 dim ft(25)
8503 restore 8550
8504 for i=1 to 24
8505 read ft(i)
8506 next i
8507 return
8508 :
8550 data 174.62,185.0,196.0,207.66
8551 data 220.0,233.08,246.96,261.64
8552 data 277.2,293.68,311.12,329.64
8553 data 349.24,370,392,415.32
8554 data 440,466.16,493.92,523.28
8555 data 554.4,487.36,622.24,659.28
8556 :
8600 rem play single or pair (n1%,n2%)
8601 if n1%=0 then 8604
8602 n%=n1%:gosub 8650:t1%=t%
8603 if n2%=0 then 8606
8604 n%=n2%:gosub 8650:t2%=t%
8605 :
8606 l%=30
8607 if n1%=0 and n2%=0 then l%=20
8608 if n1%<>0 then sound 1,t1%,l%
8609 if n2%<>0 then sound 2,t2%,l%
8610 :
8611 t%=peek(65297)/16
8612 if t%>0 then 8611
8613 return
8614 :
8650 rem convert note (n%) => t%
8651 f=ft(n%)
8652 t%=1024-(111860.781/f)
8653 return
8654 :
8800 rem get key (k$,k$$) => k$
8801 print k$; ":  "; chr$(157);
8802 k%=0
8803 if k%=0 then print " "; chr$(157);
8804 if k%=11 then print chr$(185); chr$(157);
8805 k%=k%+1
8806 if k%>20 then k%=0
8807 get k$
8808 if k$="" then 8803
8809 if asc(k$)<48 then 8805
8810 if asc(k$)>90 then 8805
8811 print k$; chr$(157);
8812 for i=1 to len(kk$)
8813 if mid$(kk$,i,1)=k$ then return
8814 next i
8815 goto 8802
8816 :
8900 rem wait for a half moment
8901 for i=1 to 200
8902 next i
