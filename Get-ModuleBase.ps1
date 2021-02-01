<#PSScriptInfo

.VERSION 0.3

.GUID 01a27130-5e5f-41f7-a699-b6e9546fdede

.AUTHOR RadicalDave

.COMPANYNAME RadicalDave

.COPYRIGHT RadicalDave

.TAGS powershell file io

.LICENSEURI https://github.com/Radical-Dave/Get-ModuleBase/blob/main/LICENSE

.PROJECTURI https://github.com/Radical-Dave/Get-ModuleBase

.ICONURI

.EXTERNALMODULEDEPENDENCIES

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES


#>

<#

.DESCRIPTION
Get path to ModuleBase of current script
In dev, there is extra level for solution that is removed
#>
$moduleName = $MyInvocation.MyCommand.Module.Name
if(!$moduleName) {
    $moduleName = $pwd #Split-Path $pwd -Leaf
    $srcFolders = "src public private tests"
    do {
        if (!$moduleName) {return}
        $moduleName = (Get-Item $moduleName).Parent.Name
        if (!$moduleName) {return}
    } While ($srcFolders.contains($moduleName.ToLower()))
}
$moduleBase = "$($MyInvocation.MyCommand.Module.ModuleBase)"
if(!$moduleBase) {$moduleBase = "$pwd"}
$ndx = $moduleBase.IndexOf($moduleName)
if($ndx -ne -1) {$moduleBase = $moduleBase.Substring(0, $ndx + $moduleName.Length)}
#Write-Output "moduleName:$moduleName"
return $moduleBase