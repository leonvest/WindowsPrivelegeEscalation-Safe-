<# 
audit_object_owners.ps1 (SAFE)

Purpose:
- Output object owner for selected AD objects (groups/users/computers)
- Helpful because unexpected ownership can indicate delegated control risks

Read-only: does NOT set owner.
#>

Import-Module ActiveDirectory -ErrorAction SilentlyContinue

param(
    [string[]]$ObjectDNs = @(
        "CN=HelpDesk,CN=Users,DC=internal,DC=initech,DC=local"
    )
)

foreach ($dn in $ObjectDNs) {
    try {
        $acl = Get-Acl -Path ("AD:\{0}" -f $dn)
        [pscustomobject]@{
            DistinguishedName = $dn
            Owner             = $acl.Owner
        } | Format-List
    } catch {
        Write-Warning "Failed to read owner for $dn : $($_.Exception.Message)"
    }
}
