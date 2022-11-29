0 rem [ intervallo                ]
1 rem [   a game written in basic ]
2 rem [   by ern0/abaddon in 2022 ]
3 :
1000 rem initialization
1001 gosub 6000
1002 gosub 6100
1003 gosub 8500
1004 :
1100 rem main screen, cold
1101 gosub 8000
1102 gosub 6300
1103 :
1200 rem main screen, hot
1201 print "difficulty level:"
1202 print
1203 print " 1: rookie (2 of basic-7 set)"
1204 print " 2: easy (3 of basic-7)"
1205 print " 3: medium (any of basic-7)"
1206 print " 4: hard (any of full-12)"
1207 print " q: quit game"
1208 print
1209 :
1210 k$="select" :kk$="12345q" :gosub 8800
1211 if k$<>"q" then 1300
1212 print "quit" :print :print "arrivederci!"
1213 end
1214 :
1300 rem game init
1301 numiv%=0
1302 if k$="1" then numiv%=2 :setiv%=7 :lvl$="rookie"
1303 if k$="2" then numiv%=3 :setiv%=7 :lvl$="easy"
1304 if k$="3" then numiv%=7 :setiv%=7 :lvl$="medium"
1305 if k$="4" then numiv%=12 :setiv%=12 :lvl$="hard"
1306 if k$="5" then numiv%=12 :setiv%=16 :lvl$="extreme"
1307 :
1308 shft%=0
1309 scre%=0
1310 l1% = -1
1311 l2% = -1
1312 :
1313 for i=0 to setiv%-1
1314 igame%(i)=iall%(i)
1315 next i
1316 for i=0 to numiv%-1
1317 slct%=int(rnd(0)*(setiv%-i))+i
1318 tmp%=igame%(i)
1319 igame%(i)=igame%(slct%)
1320 igame%(slct%)=tmp%
1321 if i=0 then 1328
1322 for j=i to 1 step -1
1323 if igame%(j-1)<igame%(j) then 1328
1324 tmp%=igame%(j)
1325 igame%(j)=igame%(j-1)
1326 igame%(j-1)=tmp%
1327 next j
1328 next i
1329 :
1400 rem game round loop
1401 for round=1 to 10
1402 try%=1 :tx%=1
1403 :
1404 kys$="qr"
1405 for i=0 to numiv%-1
1406 v%=igame%(i)
1407 k$=chr$(65+i)
1408 kys$=kys$+k$
1409 next i
1410 :
1500 rem select interval
1501 ix%=int(rnd(0)*(numiv%))
1502 theiv%=igame%(ix%)
1503 lim%=int((24-theiv%-shft%)/2)
1504 n1%=int(rnd(0)*lim%*2)+shft%
1505 n2%=n1%+theiv%
1506 if n1%=l1% and n2%=l2% then 1560
1507 l1%=n1% :l2%=n2%
1508 :
1509 gosub 8000
1510 gosub 6300
1511 print "difficulty level: ";lvl$
1512 for i=0 to numiv%-1
1513 v%=igame%(i)
1514 k$=chr$(65+i)
1515 if i=0 or i=3 or i=6 or i=9 then print :print " ";
1516 print k$;"-";nm$(v%-1);" ";
1517 next i
1518 print :print "   r-replay interval  q-quit game"
1519 gosub 6200
1520 :
1521 print "round:";round;"of 10";
1522 print " - score:";scre%
1523 :
1524 print "attempt:";try%;"- bonus:";
1525 award%=11-try%
1526 if award%<5 then award%=5
1527 print award%;"points"
1528 :
1529 gosub 8600
1530 :
1531 k$="interval" :kk$=kys$ :gosub 8800
1532 if k$="q" then 1536
1533 if k$="r" then 1540
1534 goto 1546
1535 :
1536 print "quit";
1537 gosub 8900
1538 goto 1100
1539 :
1540 try%=try%+1 :tx%=tx%+1
1541 print "retry";
1542 if tx%>4 then tx%=1 :goto 1509
1543 print
1544 goto 1521
1545 :
1546 if ix%=asc(k$)-65 then 1552
1547 :
1548 print "fail";
1549 gosub 8300
1550 goto 1557
1551 :
1552 scre%=scre%+award%
1553 print "okay";
1554 gosub 8400
1555 goto 1557
1556 :
1557 shft%=1-shft%
1558 next round
1559 :
1560 rem game end, show score
1561 gosub 8000
1562 gosub 6300
1563 print "game result" :print
1564 print "difficulty level: ";lvl$
1565 print "final score:";scre%;"/ 100"
1566 print
1567 if scre%=100 then print "perfetto, complimenti!" :goto 1572
1568 if scre%>=90 then print "great, awesome" :goto 1572
1569 if scre%>=60 then print "pretty good" :goto 1572
1570 if scre%>=30 then print "you need some practice" :goto 1572
1571 print "gg ;)"
1572 gosub 6200
1573 goto 1200
