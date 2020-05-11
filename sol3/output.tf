# output "public_ip_of_web_server" {
#     # Result is a map from instance id to public IP address, such as:
#     # { "i-004c69a7ba6ec7c4d" = "63.35.221.65", "i-027023b3b0bcc6231" = "52.17.186.35"}...
#     value = {
#         for instance in aws_instance.web-server:
#         instance.id => instance.public_ip...
#     }
# }

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

output "db_server_private_ip" {
    value = {
        for instance in aws_instance.db-server:
        instance.availability_zone => instance.private_ip...
    }
}
# output "private_ip_of_db_server" {
#     value = {
#         for instance in aws_instance.db-server:
#         instance.id => instance.private_ip...
#     }
# }


