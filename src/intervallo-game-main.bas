0 rem [ gioco a intervalli        ]
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
1103 :
1201 print "difficulty level:"
1202 print
1203 print " 0: sound test"
1204 print " 1: rookie (2 of basic-7 set)"
1205 print " 2: easy (3 of basic-7)"
1206 print " 3: medium (any of basic-7)"
1207 print " 4: hard (any of full-12)"
1208 print " q: quit game"
1209 print
1210 :
1211 k$="select" :kk$="012345q" :gosub 8800
1212 if k$="0" then 1300
1213 if k$<>"q" then 1400
1214 print "quit";
1215 gosub 8900
1216 print " - arrivederci!"
1217 end
1218 :
1300 rem sound test
1301 print "sound test"
1302 gosub 8900
1303 gosub 8000
1304 gosub 6300
1305 print "sound test"
1306 print
1307 print "press any key to play test sound"
1308 print " or [q] for quit sound test... ";
1309 st%=1
1310 k$="" :kk$="" :gosub 8800
1311 if k$="q" then 1100
1312 if st%=1 then n1%=9
1313 if st%=2 then n1%=4
1314 if st%=3 then n1%=9
1315 if st%=4 then n1%=2
1316 n2%=n1%+7
1317 if st%=1 or st%=3 then gosub 8602
1318 if st%=2 or st%=4 then gosub 8600
1319 st%=st%+1 :if st%=5 then st%=1
1320 goto 1310
1321 :
1400 rem game init
1401 numiv%=0
1402 if k$="1" then numiv%=2 :setiv%=7 :lvl$="rookie"
1403 if k$="2" then numiv%=3 :setiv%=7 :lvl$="easy"
1404 if k$="3" then numiv%=7 :setiv%=7 :lvl$="medium"
1405 if k$="4" then numiv%=12 :setiv%=12 :lvl$="hard"
1406 if k$="5" then numiv%=12 :setiv%=16 :lvl$="extreme"
1407 print lvl$
1408 :
1409 scre%=0
1410 l1%=-1 :l2%=-1
1411 :
1412 for i=0 to setiv%-1
1413 igame%(i)=iall%(i)
1414 next i
1415 for i=0 to numiv%-1
1416 slct%=int(rnd(0)*(setiv%-i))+i
1417 tmp%=igame%(i)
1418 igame%(i)=igame%(slct%)
1419 igame%(slct%)=tmp%
1420 if i=0 then 1427
1421 for j=i to 1 step -1
1422 if igame%(j-1)<igame%(j) then 1427
1423 tmp%=igame%(j)
1424 igame%(j)=igame%(j-1)
1425 igame%(j-1)=tmp%
1426 next j
1427 next i
1428 :
1429 rem game round loop
1430 for round=1 to 10
1431 try%=1 :tx%=1
1432 :
1433 kys$="qr"
1434 for i=0 to numiv%-1
1435 v%=igame%(i)
1436 k$=chr$(65+i)
1437 kys$=kys$+k$
1438 next i
1439 :
1500 rem select interval
1501 ix%=int(rnd(0)*(numiv%))
1502 theiv%=igame%(ix%)
1503 lim%=int((24-theiv%)/2)
1504 n1%=int(rnd(0)*lim%*2)
1505 n2%=n1%+theiv%
1506 if n1%=l1% and n2%=l2% then 1500
1507 l1%=n1% :l2%=n2%
1508 :
1509 gosub 8000
1510 gosub 6300
1511 print "difficulty level: ";lvl$
1512 for i=0 to numiv%-1
1513 v%=igame%(i)
1514 k$=chr$(65+i)
1515 if i=0 or i=3 or i=6 or i=9 then print :print " ";
1516 print "[";k$;"]:";nm$(v%-1);" ";
1517 next i
1518 print :print "  [r]:replay interval  [q]:quit game"
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
1529 rem play interval, read answer
1530 if try%<3 then gosub 8600 :goto 1541
1531 s1%=n1% :s2%=n2%
1532 wy%=int(rnd(1)*2)
1533 if wy%=0 then n2%=-1
1534 if wy%=1 then n1%=-1
1535 gosub 8600
1536 if wy%=0 then n1%=-1 :n2%=s2%
1537 if wy%=1 then n1%=s1% :n2%=-1
1538 gosub 8600
1539 n1%=s1% :n2%=s2%
1540 :
1541 k$="interval" :kk$=kys$ :gosub 8800
1542 :
1543 if k$<>"q" then 1548
1544 print "quit";
1545 gosub 8900
1546 goto 1100
1547 :
1548 if k$<>"r" then 1600
1549 print "retry";
1550 try%=try%+1 :tx%=tx%+1
1551 if tx%>4 then tx%=1 :goto 1509
1552 print
1553 goto 1521
1554 :
1600 rem evaluate answer
1601 v%=asc(k$)-65
1602 print nm$(igame%(v%)-1);
1603 gosub 8900
1604 if ix%=v% then 1616
1605 :
1606 print " - wrong"
1607 gosub 8300
1608 gosub 8900
1609 print "the correct answer is: ";
1610 gosub 8900
1611 print nm$(igame%(ix%)-1) :print
1612 gosub 8600
1613 gosub 6400
1614 goto 1621
1615 :
1616 scre%=scre%+award%
1617 print " - correct"
1618 gosub 8900
1619 gosub 8400
1620 :
1621 next round
1622 :
1623 rem game end, show score
1624 gosub 8000
1625 gosub 6300
1626 :
1627 gosub 8900 :print "game result" :print
1628 gosub 8900 :print "difficulty level: ";
1629 gosub 8900 :print lvl$
1630 gosub 8900 :print "final score:";
1631 gosub 8900 :print scre%;"/ 100" :print
1632 gosub 8900
1633 if scre%=100 then print "perfetto, complimenti!" :goto 1638
1634 if scre%>=90 then print "great, awesome" :goto 1638
1635 if scre%>=60 then print "pretty good" :goto 1638
1636 if scre%>=30 then print "you need some practice" :goto 1638
1637 print "gg :/"
1638 gosub 8900
1639 gosub 6200
1640 gosub 6400
1641 goto 1100
