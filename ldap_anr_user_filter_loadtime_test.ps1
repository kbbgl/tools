$term = "K"
$anrfilter = "(&(objectcategory=person)(|(anr="+ $term + ")(mail=" + $term + "*)))"
$userfilter = "(&(objectcategory=person)(|(sn="+ $term + ")(cn="+ $term + ")(userPrincipalName="+ $term + ")(givenName="+ $term + ")(mail=" + $term + "*)))"

Write-Host "Username, email, firstname/lastname results:"
Measure-Command {Get-ADUser -LDAPFilter $userfilter } | Select-Object "TotalSeconds"


Write-Host "ANR results:"
Measure-Command {Get-ADUser -LDAPFilter $anrfilter } | Select-Object "TotalSeconds"