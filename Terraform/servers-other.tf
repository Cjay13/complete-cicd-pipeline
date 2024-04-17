module "ec2_instance-jenkins" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "jenkins"

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.large"
  key_name               = "web-dev-key"
  monitoring             = true
  vpc_security_group_ids = [module.k8s_cluster_sg.security_group_id]
  subnet_id              = element(module.vpc.public_subnets, 0)
  associate_public_ip_address = true

  root_block_device = {
    volume_size = 20  
  }

  tags = {
    Project = "cicd-complete"
  }

  user_data = <<-EOF
    #!/bin/bash

    # installing java
    sudo apt update
    sudo apt install fontconfig openjdk-17-jre
    java -version

    #install jenkins if java is available
    if [ $? -eq 0 ]; then
        sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
        echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
        sudo apt-get update
        sudo apt-get install jenkins
    fi
  EOF
}

module "ec2_instance-nexus" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "nexus"

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.medium"
  key_name               = "web-dev-key"
  monitoring             = true
  vpc_security_group_ids = [module.k8s_cluster_sg.security_group_id]
  subnet_id              = element(module.vpc.public_subnets, 0)
  associate_public_ip_address = true

  root_block_device = {
    volume_size = 10  
  }

  tags = {
    Project = "cicd-complete"
  }
}

module "ec2_instance-sonar" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "sonar"

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.medium"
  key_name               = "web-dev-key"
  monitoring             = true
  vpc_security_group_ids = [module.k8s_cluster_sg.security_group_id]
  subnet_id              = element(module.vpc.public_subnets, 0)
  associate_public_ip_address = true

  root_block_device = {
    volume_size = 10  
  }

  tags = {
    Project = "cicd-complete"
  }
}