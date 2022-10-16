0 rem [ intervallo                ]
1 rem [   a game written in basic ]
2 rem [   by ern0/abaddon in 2022 ]
3 :
1000 rem initialization
1001 gosub 6000
1002 gosub 6100
1003 gosub 8500
1004 :
1100 rem main screen
1101 gosub 8000
1102 gosub 6300
1103 print "difficulty level:"
1104 print
1105 print " 1: rookie (2 of basic-7 set)"
1106 print " 2: easy (3 of basic-7)"
1107 print " 3: medium (any of basic-7)"
1108 print " 4: hard (any of full-12)"
1109 print " q: quit game"
1110 print
1111 :
1112 k$="select":kk$="12345q":gosub 8800
1113 if k$<>"q" then 1200
1114 print:print "byez"
1115 end
1116 :
1200 rem game init
1201 numiv%=0
1202 if k$="1" then numiv%=2 : setiv%=7 : lvl$="rookie"
1203 if k$="2" then numiv%=3 : setiv%=7 : lvl$="easy"
1204 if k$="3" then numiv%=6 : setiv%=7 : lvl$="medium"
1205 if k$="4" then numiv%=12 : setiv%=12 : lvl$="hard"
1206 if k$="5" then numiv%=12 : setiv%=16 : lvl$="extreme"
1207 :
1208 shft%=0
1209 scre%=0
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
1230 print "keys:  ";
1231 kys$="q"
1232 for i=0 to numiv%-1
1233 v%=igame%(i)
1234 k$=chr$(65+i)
1235 kys$=kys$+k$
1236 if i=3 or i=6 or i=9 then print:print " ";
1237 print k$;"-";nm$(i);"  ";
1238 next i
1239 print:print " r-replay interval  q-quit game"
1240 gosub 6200
1241 :
1242 ix%=int(rnd(0)*(numiv%))
1243 theiv%=igame%(ix%)
1244 lim%=int((24-theiv%-shft%)/2)
1245 n1%=int(rnd(0)*lim%*2)+shft%
1246 n2%=n1%+theiv%
1247 :
1248 print "round:";round;"of 10";
1249 print " - score:";scre%
1250 print "attempt:";try%
1251 :
1252 k$="interval":kk$=kys$:gosub 8800
1253 if k$<>"q" then 1252
1254 print "quit";
1255 gosub 8900
1256 end
1257 :
1258 shft%=1-shft%
1259 next round
1260 end
1261 :
