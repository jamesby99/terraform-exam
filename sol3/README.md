```
jamesby@ubuntu18:~/terraform/exam/terraform-exam/sol3$ terraform init
```

```
jamesby@ubuntu18:~/terraform/exam/terraform-exam/sol3$ terraform apply
Apply complete! Resources: 21 added, 0 changed, 0 destroyed.

Outputs:

db_server_private_ip = {
  "eu-west-1a" = [
    "10.10.4.163",
  ]
}
web_server_private_ip = {
  "eu-west-1a" = [
    "10.10.1.14",
  ]
  "eu-west-1b" = [
    "10.10.2.205",
  ]
  "eu-west-1c" = [
    "10.10.3.180",
  ]
}
web_server_public_ip = {
  "eu-west-1a" = [
    "18.203.153.204",
  ]
  "eu-west-1b" = [
    "34.241.222.241",
  ]
  "eu-west-1c" = [
    "54.246.248.128",
  ]
}

```
```
3개존중 1개 인스터스에 로그인
jamesby@ubuntu18:~/terraform/exam/terraform-exam/sol3$ ssh ubuntu@18.203.153.204
Warning: Permanently added '18.203.153.204' (ECDSA) to the list of known hosts.
Welcome to Ubuntu 20.04 LTS (GNU/Linux 5.4.0-1009-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Mon May 11 02:58:40 UTC 2020

  System load:  0.0               Processes:             103
  Usage of /:   16.2% of 7.69GB   Users logged in:       0
  Memory usage: 19%               IPv4 address for eth0: 10.10.1.14
  Swap usage:   0%

0 updates can be installed immediately.
0 of these updates are security updates.


The list of available updates is more than a week old.
To check for new updates run: sudo apt update


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.
```