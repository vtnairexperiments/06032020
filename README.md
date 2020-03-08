AWS 3Tier solution
******************

We are creating MySql DB, EC2 (webfacing) and installing the apache server. 

VPC configured, sebnet created for public, db and private seperately.

We re connecting Internet gateway with VPC to connect to internet.

Route table added with port details to allow traffic in

DB will be isolated from the internet.

Terraform expecting variables to be configured properly

Terraform expecting aws credentials including access, secret and pem file



Metadata
*********

We can use http://169.254.169.254/latest/meta-data/ can be used from the ec2 to fetch the metadata.

we are creaing a small bash script which will fetch the values with the help of curl command

placing all output into a json file.


Nested Dict
************

Python has a simple method to go thorug the nested Dict. 

It will go one by one step inside the Dict to find the match. As soon as it maches, it throws the answer.

we are calling the function inside the  fucntion to go inside the loop.



