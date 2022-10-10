0 rem [ intervallo                ]
1 rem [   a game written in basic ]
2 rem [   by ern0/abaddon in 2022 ]
3 :
1000 rem initialization
1001 gosub 6000
1002 gosub 6100
1003 gosub 8500
1004 :
1005 gosub 8000
1006 gosub 1100
1007 gosub 1200
1008 goto 1005
1009 :
1100 rem main screen
1101 gosub 6300
1102 print "difficulty level:"
1103 print
1104 print " 1: rookie (2 of basic-7 set)"
1105 print " 2: easy (3 of basic-7)"
1106 print " 3: medium (any of basic-7)"
1107 print " 4: hard (any of full-12)"
1108 print " q: quit game"
1109 print
1110 :
1111 k$="select":kk$="12345q":gosub 8800
1112 if k$<>"q" then return
1113 print:print "byez"
1114 end
1115 :
1200 rem game main
1201 numiv%=0
1202 if k$="1" then numiv%=2 : setiv%=7 : lvl$="rookie"
1203 if k$="2" then numiv%=3 : setiv%=7 : lvl$="easy"
1204 if k$="3" then numiv%=6 : setiv%=7 : lvl$="medium"
1205 if k$="4" then numiv%=12 : setiv%=12 : lvl$="hard"
1206 if k$="5" then numiv%=12 : setiv%=16 : lvl$="extreme"
1207 :
1208 shft%=0
1209 pts%=0
1210 :
1211 for i=0 to setiv%-1
1212 igame%(i)=iall%(i)
1213 next i
1214 :
1215 for i=0 to numiv%-1
1216 slct%=int(rnd(0)*(setiv%-i))+i
1217 tmp%=igame%(i)
1218 igame%(i)=igame%(slct%)
1219 igame%(slct%)=tmp%
1220 next i
1221 :
1222 rem game round loop
1223 for round=1 to 10
1224 try%=1
1225 :
1226 gosub 8000
1227 gosub 6300
1228 :
1229 print "difficulty level: ";lvl$
1230 print "round:";round;"of 10"
1231 print "points:";pts%
1232 print "attempt:";try%
1233 :
1234 :
1235 ix%=int(rnd(0)*(numiv%))
1236 theiv%=igame%(ix%)
1237 lim%=int((24-theiv%-shft%)/2)
1238 n1%=int(rnd(0)*lim%*2)+shft%
1239 n2%=n1%+theiv%
1240 print n1%;"-";n2%;":";theiv%;
1241 :
1242 shft%=1-shft%
1243 next round
1244 end
1245 return
