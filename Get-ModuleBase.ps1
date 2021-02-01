<#PSScriptInfo

.VERSION 0.1

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
Write-Verbose "$PSScriptRoot started:$pwd"
#$moduleName = Split-Path (Split-Path $PSScriptRoot -Parent) -Leaf

$moduleName = $MyInvocation.MyCommand.Module.Name
if(!$moduleName) {$moduleName = Split-Path $PSScriptRoot -Leaf}
Write-Verbose "moduleName:$moduleName"
$moduleBase = $MyInvocation.MyCommand.Module.ModuleBase
if(!$moduleBase) {return $PSScriptRoot}
$ndx = $moduleBase.IndexOf($moduleName)
if($ndx -ne -1) {$moduleBase = $moduleBase.Substring(0, $ndx + $moduleName.Length)}
Write-Verbose "moduleBase:$moduleBase"
return $moduleBase