# amihasicorp
This repo served as learning tool for learning how to install & deploy HashiCorp Packer to build machine images. 

Install HashiCorp Packer
1. In the scripts folder run  "installpacker.sh"

Configure Environment on Bastion Host
1. Configure Native HCL syntax highlighting:
    1. Make a directory -p ~/.vim/pack/jvirtanen/start
    2. Navigate to the directory cd ~/.vim/pack/jvirtanen/start
    3. Clone directory git clone git://github.com/jvirtanen/vim-hcl.git

Configured .pkr.hcl template
1. Set Variables
2. Create a source section (This is what the ami will be built from)
3. Create a build section which reference the source mentioned above
4. Create a provisioner section which ran scripts to automatically install Chef and create orgs and users.