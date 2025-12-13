<# 
find_risky_group_acls.ps1 (SAFE)

Purpose:
- Enumerate selected AD groups
- Read ACLs (no modification)
- Flag ACEs that grant risky rights (WriteOwner / WriteDACL / GenericAll / WriteProperty)

This script does NOT change anything in AD.
#>

Import-Module ActiveDirectory -ErrorAction SilentlyContinue

param(
    [string]$SearchBase = "CN=Users,DC=internal,DC=initech,DC=local",
    [string[]]$GroupNames = @("HelpDesk"),
    [string]$OutCsv = ".\risky_group_acls.csv"
)

$riskyRights = @(
    "GenericAll",
    "WriteDacl",
    "WriteOwner",
    "GenericWrite"
)

$results = @()

foreach ($g in $GroupNames) {
    $group = Get-ADGroup -Identity $g -ErrorAction SilentlyContinue
    if (-not $group) {
        Write-Warning "Group not found: $g"
        continue
    }

    $dn = $group.DistinguishedName
    $acl = Get-Acl -Path ("AD:\{0}" -f $dn)

    foreach ($ace in $acl.Access) {
        $rights = $ace.ActiveDirectoryRights.ToString()

        # Flag if any risky right appears
        $isRisky = $false
        foreach ($r in $riskyRights) {
            if ($rights -match $r) { $isRisky = $true; break }
        }

        if ($isRisky) {
            $results += [pscustomobject]@{
                Group              = $g
                DistinguishedName  = $dn
                IdentityReference  = $ace.IdentityReference.ToString()
                AccessControlType  = $ace.AccessControlType.ToString()
                ActiveDirectoryRights = $rights
                InheritanceType    = $ace.InheritanceType.ToString()
                IsInherited        = $ace.IsInherited
            }
        }
    }
}

$results | Sort-Object Group, IdentityReference | Export-Csv -NoTypeInformation -Encoding UTF8 -Path $OutCsv
Write-Output "Saved: $OutCsv"
