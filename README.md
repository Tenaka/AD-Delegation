# AD-Delegation

Today is a quick explanation regarding OU delegation using PowerShell with usable examples and how-to located the GUID that identifies the object type being delegated.

All the required scripts can be found on my Github (here).

Delegated Test Account:
For demonstration purposes, the following is executed directly on the Domain Controller and as a Domain Admin.

Create a test user named 'SrvOps' and add it to the 'Server Operators', group. This effectively provides Administrator privileges on the DC's without access to AD.

Create the following Global Groups, CompDele, UserDele and GroupDele and to the SrvOps user. 

Greate the following OU's, Computer, User and Group.

Shift and Right-click 'Active Directory Users and Computer' and 'Run as a Different User', and enter the SrvOps credentials. Right-click on the Computer OU and you will notice that there's no options to New and select an object type.

ADSI Edit and Object GUID:
Close the AD snap-in.

Back to Domain Admin and launch 'adsiedit.msc'.

Select 'Schema' from the 'Select a well known Naming Context:' and OK.

Scroll down and select 'CN=Computer' properties.

On the 'Attribute Editor' tab scroll down and locate 'schemaIDGUID'. This is the Guid object identity used for delegating Computer objects.

It's not possible to copy the value directly and double clicking provides Hex or Binary values which can be copied. 

The following converts the Hex to the required Guid value.

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

The Script:
Download the scripts from Github (here) and open with Powershell_ise.

Update the DN, the OU path to the Computer OU created earlier.

Execute the script and repeat for Users and Groups scripts.

Relaunch 'Active Directory Users and Computers' as a different user and enter the SrvOps account credentials.

Right-click on each of the OU's and 'New'. You will notice SrvOps can now create objects relative to the name of the OU.

Final Considerations:
Retrieving the 'schemaIDGUID' from ADSI Edit allows the delegation of pretty much any object type within AD and for the most part a couple of minor tweaks to the scripts provided and your set.

Enjoy and if you find this useful please provide some feedback via the homepage's comment box.
