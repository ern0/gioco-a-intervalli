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
1006 print "----------------------------------------"
1007 print "  intervallo - minimalistic music game"
1008 print "   https://github.com/ern0/intervallo"
1009 print "----------------------------------------"
1010 print
1011 print "difficulty:"
1012 print
1013 print " 1: rookie (2 of basic-7 set)"
1014 print " 2: easy (3 of basic-7)"
1015 print " 3: medium (any of basic-7)"
1016 print " 4: hard (any of full-12)"
1017 print " q: quit game"
1018 print
1019 k$="select":kk$="1234q":gosub 8800
1020 if k$<>"q" goto 1022
1021 print:print "byez"
1022 end
1023 :
1024 st%=0
1025 if k$="1" then se%=2 : st%=7
1026 if k$="2" then se%=3 : st%=7
1027 if k$="3" then se%=6 : st%=7
1028 if k$="4" then se%=12 : st%=12
1029 if k$="5" then se%=12 : st%=16
1030 if st%=0 goto 1019
1031 :
1032 print se%,st%
1033 end
