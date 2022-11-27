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
1130 print
1131 :
1132 k$="select":kk$="12345q":gosub 8800
1133 if k$<>"q" then 1200
1134 print:print "byez"
1135 end
1136 :
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
1230 :
1231 for i=0 to setiv%-1
1232 igame%(i)=iall%(i)
1233 next i
1234 :
1235 for i=0 to numiv%-1
1236 slct%=int(rnd(0)*(setiv%-i))+i
1237 tmp%=igame%(i)
1238 igame%(i)=igame%(slct%)
1239 igame%(slct%)=tmp%
1260 next i
1261 :
1262 rem game round loop
1263 for round=1 to 10
1264 try%=1
1265 :
1266 gosub 8000
1267 gosub 6300
1268 :
1269 print "difficulty level: ";lvl$
1290 kys$="qr"
1291 for i=0 to numiv%-1
1292 v%=igame%(i)
1293 k$=chr$(65+i)
1294 kys$=kys$+k$
1295 if i=0 or i=3 or i=6 or i=9 then print:print " ";
1296 print k$;"-";nm$(v%-1);" ";
1297 next i
1298 print:print "   r-replay interval  q-quit game"
1299 gosub 6200
1320 :
1321 ix%=int(rnd(0)*(numiv%))
1322 theiv%=igame%(ix%)
1323 lim%=int((24-theiv%-shft%)/2)
1324 n1%=int(rnd(0)*lim%*2)+shft%
1325 n2%=n1%+theiv%
1326 print "round:";round;"of 10";
1327 print " - score:";scre%
1328 :
1329 print "attempt:";try%;"- bonus:";
1330 award%=11-try%
1331 if award%<5 then award%=5
1332 print award%;"points"
1333 :
1334 gosub 8600
1335 :
1336 k$="interval":kk$=kys$:gosub 8800
1337 if k$="q" then 1341
1338 if k$="r" then 1345
1339 goto 1351
1340 :
1341 print "quit";
1342 gosub 8900
1343 goto 1100
1344 :
1345 try%=try%+1
1346 print "retry";
1347 print
1348 goto 1329
1349 :
1350 :
1351 if ix%=asc(k$)-65 then 1357
1352 :
1353 print "fail";
1354 gosub 8250
1355 goto 1362
1356 :
1357 scre%=scre%+award%
1358 print "okay";
1359 gosub 8300
1360 goto 1362
1361 :
1362 shft%=1-shft%
1363 next round
1364 gosub 8000
1365 gosub 6300
1366 print "difficulty level: ";lvl$
1367 print "final score:";scre%
1368 end
