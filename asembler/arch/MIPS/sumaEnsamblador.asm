.data
pi: .float 6.2830
radio: .float 3.0
res: .float 0.0

.text
l.s $f0,pi
l.s $f2,radio
mul.s  $f1,$f0,$f2