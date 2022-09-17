6000 rem setup interval names
6001 dim nm$(20)
6002 restore 6080
6003 for i=0 to 12
6004 read nm$(i)
6005 next i
6006 return
6007 :
6080 data "min.2nd"
6081 data "maj.2nd"
6082 data "min.3rd"
6083 data "maj.3rd"
6084 data "perf.4th"
6085 data "dim5/aug4"
6086 data "perf.5th"
6087 data "min.6th"
6088 data "maj.6th"
6089 data "min.7th"
6090 data "maj.7th"
6091 data "perf.oct"
6092 :
