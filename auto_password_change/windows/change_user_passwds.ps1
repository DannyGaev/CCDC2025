# Guide on changing user account passwords: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.localaccounts/set-localuser?view=powershell-5.1

$characters="abcdefghijklmnopqrstuvwxyz0123456789#$&*!@"

Write-Host "Resetting user account passwords...`n"

# Parse through all users on the systenm
Get-LocalUser | 
    ForEach-Object  { 

        # Only change passwords for users with RID greater than or equal to 1000 and whose name is not 'promon'
        if ([int]($_.SID -split "-")[-1] -ge 500 -and $_.Name -ne "WDAGUtiliyAccount") 
        {
            $UnsecureNewPassword = ""
            $val=0
            while($val -ne 16)
            {
                $val++
                $index = Get-Random -Minimum 0 -Maximum $characters.Length
                $UnsecureNewPassword += $characters.Substring($index, 1)
            } 
            # Thank you to https://learn.microsoft.com/en-us/answers/questions/1469110/input-string-was-not-in-a-correct-format for assistance with creating secure strings from plaintext
            $SecureNewPassword = ConvertTo-SecureString -String $UnsecureNewPassword -AsPlainText -Force
            $_ | Set-LocalUser -Password $SecureNewPassword
            if($?)
            {
                Write-Host ("{0}`t{1}"-f $_.Name, $UnsecureNewPassword)
            }
            else
            {
                Write-Host "Failed to change password for user '$_.Name'"
            }

        }
    }