$trim = ("86 7A 96 BF E6 0D D0 11 A2 85 00 AA 00 30 49 E2").replace(" ","")

$oct = "$trim"

$oct1 = $oct.substring(0,2)
$oct2 = $oct.substring(2,2)
$oct3 = $oct.substring(4,2)
$oct4 = $oct.substring(6,2)
$oct5 = $oct.substring(8,2)
$oct6 = $oct.substring(10,2)
$oct7 = $oct.substring(12,2)
$oct8 = $oct.substring(14,2)
$oct9 = $oct.substring(16,4)
$oct10 = $oct.substring(20,12)

$strOut = "$oct4" + "$oct3" + "$oct2" + "$oct1" + "-" + "$oct6" + "$oct5" + "-" + "$oct8" + "$oct7" + "-" + "$oct9" + "-" + "$oct10"

write-host $strOut

#result = BF967A86-0DE6-11D0-A285-00AA003049E2