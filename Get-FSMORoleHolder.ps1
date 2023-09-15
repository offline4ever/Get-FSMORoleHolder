#Requires –Modules ActiveDirectory

﻿Function Get-FSMORoleHolder {
    #Get information from domain and forest
    $InfRidPdc = Get-ADDomain | Select-Object InfrastructureMaster, RIDMaster, PDCEmulator
    $DnSch = Get-ADForest | Select-Object DomainNamingMaster, SchemaMaster

    #Create new object with FSMO properties
    $result = New-Object -TypeName System.Object
    $result | Add-Member -MemberType NoteProperty -Name "InfrastructureMaster" -Value $InfRidPdc.InfrastructureMaster
    $result | Add-Member -MemberType NoteProperty -Name "RIDMaster" -Value $InfRidPdc.RIDMaster
    $result | Add-Member -MemberType NoteProperty -Name "PDCEmulator" -Value $InfRidPdc.PDCEmulator
    $result | Add-Member -MemberType NoteProperty -Name "DomainNamingMaster" -Value $DnSch.DomainNamingMaster
    $result | Add-Member -MemberType NoteProperty -Name "SchemaMaster" -Value $DnSch.SchemaMaster

    #Return results
    return $result
}
