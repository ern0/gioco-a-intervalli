8000 rem clear screen, set colors
8001 print chr$(147)
8002 :
8100 rem reset colors
8101 poke 53280,6
8102 poke 53281,14
8103 :
8200 rem set cursor color to normal
8201 poke 646,1
8202 return
8203 :
8500 rem initialize sound
8501 rem todo
8502 return
5330 :
8600 rem play single or pair (n1%,n2%)
8601 rem todo
8602 return
8603 :
