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
8300 rem flash border red
8301 c%=3 :l%=2
8302 goto 8403
8303 :
8400 rem flash border green
8401 c%=6 :l%=4
8402 :
8403 color 4,c%,l%
8404 gosub 8900
8405 goto 8100
8406 :
8500 rem initialize sound
8501 poke 65297,7
8502 dim ft(24)
8503 restore 8550
8504 for i=0 to 23
8505 read ft(i)
8506 next i
8507 return
8508 :
8550 data 174.62,185.0,196.0,207.66
8551 data 220.0,233.08,246.96,261.64
8552 data 277.2,293.68,311.12,329.64
8553 data 349.24,370,392,415.32
8554 data 440,466.16,493.92,523.28
8555 data 554.4,587.36,622.24,659.28
8556 :
8600 rem play single or pair (n1%,n2%)
8601 l%=30 :goto 8603
8602 l%=15
8603 if n1%=-1 then 8605
8604 n%=n1% :gosub 8616 :t1%=t%
8605 if n2%=-1 then 8606
8606 n%=n2% :gosub 8616 :t2%=t%
8607 :
8608 if n1%=-1 or n2%=-1 then l%=20
8609 if n1%<>-1 then sound 1,t1%,l%
8610 if n2%<>-1 then sound 2,t2%,l%
8611 :
8612 t%=peek(65297)/16
8613 if t%>0 then 8612
8614 return
8615 :
8616 rem convert note (n%) => t%
8617 f=ft(n%)
8618 t%=1024-(111860.781/f)
8619 return
8620 :
8800 rem get key (k$,kk$) => k$
8801 print k$;
8802 if kk$<>"" then print ":[ ]";chr$(157);chr$(157);
8803 :
8804 k%=0
8805 if k%=0 then print chr$(185);chr$(157);
8806 if k%=10 then print " ";chr$(157);
8807 k%=k%+1 :if k%>18 then k%=0
8808 :
8809 get k$ :if k$="" then 8805
8810 if kk$="" then return
8811 if asc(k$)<48 then 8809
8812 if asc(k$)>90 then 8809
8813 print k$;
8814 :
8815 for i=1 to len(kk$)
8816 if mid$(kk$,i,1)=k$ then 8823
8817 next i
8818 :
8819 gosub 9000
8820 print chr$(157);
8821 goto 8804
8822 :
8823 gosub 9000
8824 print chr$(157);chr$(157);"   ";chr$(157);chr$(157);
8825 gosub 9000
8826 return
8827 :
8900 rem wait for a full blink of eye
8901 for i=1 to 250 :next i
8902 return
8903 :
9000 rem wait for a half blink of eye
9001 for i=1 to 150 :next i
9002 return
9003 :
