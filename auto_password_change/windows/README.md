**Powershell must be run with administrator privileges for the script to successfully execute**


Command to change passwords:   

```console
   PS C:\Users\{USER}\Desktop\CCDC2025\auto_password_change\windows> change_user_passwds.ps1
```

The output will look something like this:

```console
   PS C:\Users\{USER}\Desktop\CCDC2025\auto_password_change\windows> change_user_passwds.ps1
   Resetting user account passwords...

   TempUser     w#k!t32yv7l$*n5#
```

**If unable to use git for download, try wget:**
```console
   oaktree@OakTree:~/$ wget https://raw.githubusercontent.com/DannyGaev/CCDC2025/refs/heads/main/auto_password_change/windows/change_user_passwds.sh
   oaktree@OakTree:~/$ wget https://raw.githubusercontent.com/DannyGaev/CCDC2025/refs/heads/main/auto_password_change/windows/gen_and_update.sh
```
