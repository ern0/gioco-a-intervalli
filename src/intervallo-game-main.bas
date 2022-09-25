0 rem [ intervallo                ]
1 rem [   a game written in basic ]
2 rem [   by ern0/abaddon in 2022 ]
3 :
1000 rem initialization
1001 gosub 6000
1002 gosub 8500
1003 :
1004 gosub 8000
1005 gosub 1100
1006 gosub 1200
1007 goto 1004
1008 :
1100 rem main screen
1101 gosub 6300
1102 print "difficulty:"
1103 print
1104 print " 1: rookie (2 of basic-7 set)"
1105 print " 2: easy (3 of basic-7)"
1106 print " 3: medium (any of basic-7)"
1107 print " 4: hard (any of full-12)"
1108 print " q: quit game"
1109 print
1110 :
1111 k$="select":kk$="1234q":gosub 8800
1112 if k$<>"q" then return
1113 print:print "byez"
1114 end
1115 :
1200 rem game main
1201 ni%=0
1202 if k$="1" then ni%=2 : si%=7 : d$="rookie"
1203 if k$="2" then ni%=3 : si%=7 : d$="easy"
1204 if k$="3" then ni%=6 : si%=7 : d$="medium"
1205 if k$="4" then ni%=12 : si%=12 : d$="hard"
1206 if k$="5" then ni%=12 : si%=16 : d$="extreme"
1207 :
1208 gosub 8000
1209 gosub 6300
1210 print "difficulty: ";d$
1211 for rd=1 to 10
1212 print "round ";rd;" of 10"
1213 :
1214 next rd
1215 end
1216 return
