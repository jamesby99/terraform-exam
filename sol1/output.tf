output "web_server_private_ip" {
    value = {
        for instance in aws_instance.web-server:
        instance.availability_zone => instance.private_ip...
    }
}

output "web_server_public_ip" {
    value = {
        for instance in aws_instance.web-server:
        instance.availability_zone => instance.public_ip...
    }
}

