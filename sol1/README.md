```
jamesby@ubuntu18:~/terraform/exam/terraform-exam/sol1$ terraform init
```

```
jamesby@ubuntu18:~/terraform/exam/terraform-exam/sol1$ terraform apply
```

```
jamesby@ubuntu18:~/terraform/exam/terraform-exam/sol1$ ssh ubuntu@54.180.98.70
Warning: Permanently added '54.180.98.70' (ECDSA) to the list of known hosts.
Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-1065-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Mon May 11 02:31:09 UTC 2020

  System load:  0.0               Processes:           87
  Usage of /:   13.7% of 7.69GB   Users logged in:     0
  Memory usage: 14%               IP address for eth0: 172.31.35.151
  Swap usage:   0%

0 packages can be updated.
0 updates are security updates.



The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

```

```
jamesby@ubuntu18:~/terraform/exam/terraform-exam/sol1$ curl 54.180.98.70
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully       installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```
