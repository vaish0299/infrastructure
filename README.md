# infrastructure
##AWS Networking Setup
*Create a Virtual Private Cloud (VPC)
*Create 3 subnets each in a different availability zones in the same region in the same VPC.
*Create and attach the internet gateway to VPC
*Create a public route table
*Create a public route in the public route table created above with the destination CIDR block 0.0.0.0/0 and internet gateway created above as the target.
￼
##Creation of the Stack:
*Run the script 
*Using the following command

**sh script-name.sh stack-name vpc-name vpc-cidr subnet1-cidr  subnet2-cidr  subnet3-cidr profile-name

*Profile-name : the AWS configured profile you want to use 

**Ex commands:
*sh csye6225-createStack-script.sh newStack1 newVPC1 us-east-1 10.0.0.0/16 10.1.0.0/24 10.2.0.0/24 10.3.0.0/24 demo

*sh csye6225-createStack-script.sh newStack2 newVPC2 us-east-1 192.168.0.0/16 192.168.1.0/24 192.168.2.0/24 192.168.3.0/24 demo

*sh csye6225-createStack-script.sh newStack3 newVPC3 us-east-1 172.31.0.0/16 172.31.1.0/24 172.31.2.0/24 172.31.3.0/24 demo

*SETUP OF AWS CLI:
*Install the AWS CLI
*Set up the profiles 