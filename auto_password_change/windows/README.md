**Powershell must be run with administrator privileges for the script to successfully execute**


Command to change passwords:   

```powershell
   PS C:\Users\{USER}\Desktop\CCDC2025\auto_password_change\windows> change_user_passwds.ps1
```

The output will look something like this:

```powershell
   PS C:\Users\{USER}\Desktop\CCDC2025\auto_password_change\windows> change_user_passwds.ps1
   Resetting user account passwords...

   TempUser     w#k!t32yv7l$*n5#
```

**If unable to use git for download, try wget:**
```powershell
   oaktree@OakTree:~/$ wget https://raw.githubusercontent.com/DannyGaev/CCDC2025/refs/heads/main/auto_password_change/windows/change_user_passwds.ps1
```
