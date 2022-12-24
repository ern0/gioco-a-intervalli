6000 rem setup interval names: nm$()
6001 dim nm$(20)
6002 restore 6050
6003 for i=0 to 16
6004 read nm$(i)
6005 next i
6006 return
6007 :
6050 data "min.2nd"
6051 data "maj.2nd"
6052 data "min.3rd"
6053 data "maj.3rd"
6054 data "perf.4th"
6055 data "dim5/aug4"
6056 data "perf.5th"
6057 data "min.6th"
6058 data "maj.6th"
6059 data "min.7th"
6060 data "maj.7th"
6061 data "perf.oct"
6062 data "oct+min2"
6063 data "oct+maj2"
6064 data "oct+min3"
6065 data "oct+maj3"
6066 :
6100 rem setup intervals, diff. order: iall()
6101 dim iall%(20)
6102 restore 6150
6103 for i=0 to 16
6104 read iall%(i)
6105 next i
6106 dim igame%(16)
6107 return
6108 :
6150 data 7,5,3,4,2,1,12
6151 data 6,8,9,10,11
6152 data 13,14,15,16
6153 :
6200 rem print separator line
6201 print "----------------------------------------"
6202 return
6203 :
6300 rem print header
6301 gosub 6200
6302 print " intervallo plus/4 - the interval game"
6303 print "  https://github.com/ern0/intervallo"
6304 gosub 6200
6305 return
6306 :
6400 rem press any key to continue
6401 k$="press any key to continue... " :kk$="" :gosub 8800
6402 return
6403 :
