Give execution privilges to both scripts:

```console
   oaktree@OakTree:~/CCDC2025/auto_password_change$ chmod +x change_user_passwds.sh
   oaktree@OakTree:~/CCDC2025/auto_password_change$ chmod +x gen_and_update.sh
```

Command to change passwords:   

```console
   oaktree@OakTree:~/CCDC2025/auto_password_change$ ./change_user_passwds.sh
```

The output will look something like this:

```console
   oaktree@OakTree:~/CCDC2025/auto_password_change$ ./change_user_passwds.sh
   [sudo] password for oaktree:
   root       qqh9f^3&0z@mga7k
   nobody     gm*kdajj0k!v709m
   oaktree    !e&mh5k^r!2ns*ze
   new_user   er71qcacx78z!99a 
```

**If unable to use git for download, try wget:**
```console
   oaktree@OakTree:~/$ wget https://raw.githubusercontent.com/DannyGaev/CCDC2025/refs/heads/main/auto_password_change/linux/change_user_passwds.sh
   oaktree@OakTree:~/$ wget https://raw.githubusercontent.com/DannyGaev/CCDC2025/refs/heads/main/auto_password_change/linux/gen_and_update.sh
```
