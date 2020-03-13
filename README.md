# Alteryx Server Deployment Process
================================

This documentation describes the process for building an Alteryx Server AMI image for your target region. The deploy that Image to a custom build environment with Cloud best practices built in.

The full process for creating the AMI is completed with a Packer script (described [here](packer\PACKER_README.md) )


The full process for creating the AMI is completed with a Packer script (described [here](terraform\TERRAFORM_README.md) )

## Project Listing
================================

Checklist of components in the process

- [x] AMI creation
- [x] VPC
- [x] Security Groups
- [ ] Jump box
- [ ] Automated SSH Key Creation
- [ ] Separate MongoDB instances
- [ ] Automated Maintenance scripts
