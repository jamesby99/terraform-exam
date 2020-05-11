```
jamesby@ubuntu18:~/terraform/exam/terraform-exam/sol2$ terraform init
```

```
jamesby@ubuntu18:~/terraform/exam/terraform-exam/sol2$ terraform apply
.......
.......
Apply complete! Resources: 5 added, 0 changed, 0 destroyed.

Outputs:

web_server_private_ip = {
  "eu-west-1c" = [
    "172.31.0.80",
    "172.31.14.218",
    "172.31.5.208",
    "172.31.14.82",
  ]
}
web_server_public_ip = {
  "eu-west-1c" = [
    "63.33.60.130",
    "34.244.75.255",
    "3.249.227.247",
    "3.250.187.6",
  ]
}
```

```
jamesby@ubuntu18:~/terraform/exam/terraform-exam/sol2$ ssh ubuntu@63.33.60.130

```
jamesby@ubuntu18:~/terraform/exam/terraform-exam/sol2$ curl 63.33.60.130
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
```
