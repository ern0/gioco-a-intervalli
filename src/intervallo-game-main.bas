0 rem [ intervallo                ]
1 rem [   a game written in basic ]
2 rem [   by ern0/abaddon in 2022 ]
3 :
1000 rem initialization
1001 gosub 6000
1002 gosub 8000
1003 gosub 8500
1004 :
1005 rem main screen
1006 print "  intervallo - minimalistic music game"
1007 :
1008 rem test
1009 n1%=1:n2%=0:gosub 8600
1010 n1%=4:n2%=0:gosub 8600
1011 n1%=6:n2%=18:gosub 8600
1012 :
1013 print "to be continued..."
5999 end
