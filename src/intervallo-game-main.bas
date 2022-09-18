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
1007 print
1008 print "difficulty:"
1009 print " 1: rookie (2 of basic-7 set)"
1010 print " 2: easy (3 of basic-7)"
1011 print " 3: medium (any of basic-7)"
1012 print " 4: hard (any of full-12)"
1013 print " q: quit game"
1014 k$="select":kk$="1234q":gosub 8800
1015 if k$<>"q" goto 1017
1016 print:print "byez"
1017 end
1018 :
1019 st%=0
1020 if k$="1" then se%=2 : st%=7
1021 if k$="2" then se%=3 : st%=7
1022 if k$="3" then se%=6 : st%=7
1023 if k$="4" then se%=12 : st%=12
1024 if k$="5" then se%=12 : st%=16
1025 if st%=0 goto 1014
1026 :
1027 print se%,st%
1028 end
