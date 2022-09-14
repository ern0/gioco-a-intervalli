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
5320 rem volume 7 doesn't work on emu
5330 return
5340 :
5400 rem play notes (n1%,n2%)
5410 if n1%=0 then 5500
5420 f1=440.0
5430 t1%=1024-(111860.781/f1)
5450 :
5500 if n2%=0 then 5600
5500 f2=523.28
5510 t2%=1024-(111860.781/f2)
5520 :
5600 l%=30
5610 if n1%=0 and n2%=0 then l%=20
5620 if n1%<>0 then sound 1,t1%,l%
5630 if n2%<>0 then sound 2,t2%,l%
5640 return
5650 :