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
1134 print "quit":print:print "arrivederci!"
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
1264 try%=1:tx%=1
1265 :
1290 kys$="qr"
1291 for i=0 to numiv%-1
1292 v%=igame%(i)
1293 k$=chr$(65+i)
1294 kys$=kys$+k$
1295 next i
1296 :
1297 ix%=int(rnd(0)*(numiv%))
1298 theiv%=igame%(ix%)
1299 lim%=int((24-theiv%-shft%)/2)
1300 n1%=int(rnd(0)*lim%*2)+shft%
1301 n2%=n1%+theiv%
1302 :
1303 gosub 8000
1304 gosub 6300
1305 print "difficulty level: ";lvl$
1306 for i=0 to numiv%-1
1307 v%=igame%(i)
1308 k$=chr$(65+i)
1309 if i=0 or i=3 or i=6 or i=9 then print:print " ";
1310 print k$;"-";nm$(v%-1);" ";
1311 next i
1312 print:print "   r-replay interval  q-quit game"
1313 gosub 6200
1314 :
1315 print "round:";round;"of 10";
1316 print " - score:";scre%
1317 :
1318 print "attempt:";try%;"- bonus:";
1319 award%=11-try%
1320 if award%<5 then award%=5
1321 print award%;"points"
1322 :
1323 gosub 8600
1324 :
1325 k$="interval":kk$=kys$:gosub 8800
1326 if k$="q" then 1330
1327 if k$="r" then 1334
1328 goto 1340
1329 :
1330 print "quit";
1331 gosub 8900
1332 goto 1100
1333 :
1334 try%=try%+1:tx%=tx%+1
1335 print "retry";
1336 if tx%>4 then tx%=1:goto 1303
1337 print
1338 goto 1315
1339 :
1340 if ix%=asc(k$)-65 then 1346
1341 :
1342 print "fail";
1343 gosub 8300
1344 goto 1351
1345 :
1346 scre%=scre%+award%
1347 print "okay";
1348 gosub 8400
1349 goto 1351
1350 :
1351 shft%=1-shft%
1352 next round
1353 gosub 8000
1354 gosub 6300
1355 print "difficulty level: ";lvl$
1356 print "final score:";scre%
1357 if scre%=100 then print "perfetto, complimenti!"
1358 print
1359 k$="press a key":kk$="":gosub 8800
1360 goto 1100
