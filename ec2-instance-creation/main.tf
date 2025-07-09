provider "aws" {
    region = "ap-south-1"  # Set your desired AWS region
}

resource "aws_instance" "example" {
    ami           = "ami-0d03cb826412c6b0f"  # Specify an appropriate AMI ID
    instance_type = "t2.micro"
}
