5000 rem clear screen, reset colors
5010 scnclr
5020 :
5100 rem reset colors
5110 color 4,7,1
5120 color 0,7,2
5131 :
5200 rem reset cursor color
5210 color 1,2,7
5220 return
5230 :
5300 rem initialize sound
5310 poke 65297,7
5320 dim ft(25)
5330 restore 5400
5340 for i=1 to 24
5350 read ft(i)
5360 next i
5370 return
5380 :
5400 data 174.62,185.0,196.0,207.66,220.0
5350 data 233.08,246.96,261.64,277.2,293.68
5360 data 311.12,329.64,349.24,370,392
5370 data 415.32,440,466.16,493.92,523.28
5380 data 554.4,487.36,622.24,659.28
5390 :
5500 rem play notes (n1%,n2%)
5510 if n1%<>0 then n%=n1%:gosub 5700:t1%=t%
5520 if n2%<>0 then n%=n2%:gosub 5700:t2%=t%
5530
5540 l%=30
5550 if n1%=0 and n2%=0 then l%=20
5560 if n1%<>0 then sound 1,t1%,l%
5570 if n2%<>0 then sound 2,t2%,l%
5580 :
5590 t%=peek(65297)/16
5600 if t%>0 goto 5590
5610 return
5620 :
5700 rem note (n%) to ted (t%)
5710 f=ft(n%)
5720 t%=1024-(111860.781/f)
5730 return