$OU = "OU=Resources,DC=tenaka,DC=loc"
$GroupName = "TESTGP"

Import-Module activedirectory    
Set-Location AD:

$ouACL = (get-acl -path $OU).Access
$getGp = Get-ADGroup -Identity $GroupName
$GroupSID = [System.Security.Principal.SecurityIdentifier] $Group.SID
$ouACL = Get-Acl -Path $OU

$gpIndent = [System.Security.Principal.IdentityReference] $GroupSID
$ActiveDirectoryRights = [System.DirectoryServices.ActiveDirectoryRights]::GenericAll
$AccessControlType = [System.Security.AccessControl.AccessControlType]::Allow
$ObjectType = [guid] "00000000-0000-0000-0000-000000000000"
$InheritanceType = [System.DirectoryServices.ActiveDirectorySecurityInheritance]::Descendents
$InheritedObjectType = [guid] "bf967aba-0de6-11d0-a285-00aa003049e2"
$ACE = New-Object System.DirectoryServices.ActiveDirectoryAccessRule $gpIndent, $ActiveDirectoryRights, $AccessControlType, $ObjectType, $InheritanceType, $InheritedObjectType

$ouACL.AddAccessRule($ACE)
Set-Acl -Path $OU -AclObject $ouACL


$ActiveDirectoryRights = [System.DirectoryServices.ActiveDirectoryRights]::CreateChild
$AccessControlType = [System.Security.AccessControl.AccessControlType]::Allow
$ObjectType = [guid] "bf967aba-0de6-11d0-a285-00aa003049e2"
$InheritanceType = [System.DirectoryServices.ActiveDirectorySecurityInheritance]::Descendents
$InheritedObjectType = [guid] "00000000-0000-0000-0000-000000000000"
$ACE = New-Object System.DirectoryServices.ActiveDirectoryAccessRule $gpIndent, $ActiveDirectoryRights, $AccessControlType, $ObjectType, $InheritanceType, $InheritedObjectType

$ouACL.AddAccessRule($ACE)
Set-Acl -Path $OU -AclObject $ouACL

$ActiveDirectoryRights = [System.DirectoryServices.ActiveDirectoryRights]::DeleteChild
$AccessControlType = [System.Security.AccessControl.AccessControlType]::Allow
$ObjectType = [guid] "bf967aba-0de6-11d0-a285-00aa003049e2"
$InheritanceType = [System.DirectoryServices.ActiveDirectorySecurityInheritance]::Descendents
$InheritedObjectType = [guid] "00000000-0000-0000-0000-000000000000"
$ACE = New-Object System.DirectoryServices.ActiveDirectoryAccessRule $gpIndent, $ActiveDirectoryRights, $AccessControlType, $ObjectType, $InheritanceType, $InheritedObjectType


 $ouACL.AddAccessRule($ACE)
 Set-Acl -Path $OU -AclObject $ouACL