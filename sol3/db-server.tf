resource "aws_instance" "db-server" {

    count                   = var.DB_SERVER_COUNT
    ami                     = lookup(var.AMIS, var.AWS_REGION)
    instance_type           = var.INSTANCES_MICRO
    key_name                = aws_key_pair.public_key.key_name
    subnet_id               = aws_subnet.kiunsen-private[count.index%var.PRIVATE_SUBNET_NUMBERS].id
    vpc_security_group_ids  = [aws_security_group.allow-mysql.id]

    connection {
        # host        = self.public_ip
        user        = var.INSTANCE_USERNAME
        private_key = file(var.PATH_TO_PRIVATE_KEY)
    }


    tags = {
        Name = format("db-%d-v:%s", count.index+1, var.VERSION)
    }

}

