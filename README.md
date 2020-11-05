This repo illustrates the basic steps to:
- install or upgrade terraform (if already installed) on your dev Mac
- create your AWS account, with free tier (if you don't have one yet)
- configure and launch an EC2 instance on AWS
- login to the instance

### Install or update Terraform on your Mac

- install [homebrew](https://brew.sh/), a package manager, if not already done
- install the HashiCorp tap, a repository of all our Homebrew packages, by entering `brew tap hashicorp/tap`
- open your Terminal and enter `$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
- enter `$ brew install hashicorp/tap/terraform` or `brew update hashicorp/tap/terraform` if already installed (check you version with `terraform -v`)
-  Check your installation ny entering `terraform -v`: you should get the just installed version
-  If you get an error that terraform could not be found, your PATH environment variable was not set up properly. Please go back and ensure that your PATH variable contains the directory where Terraform was installed.
-  See [here[here](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started) for detailed instructions.

### Create or access your AWS Account
- If don't have an AWS account, you can create one [here](https://aws.amazon.com/free/?trk=ps_a134p000003yhhbAAA&trkCampaign=acq_paid_search_brand&sc_channel=ps&sc_campaign=acquisition_IT&sc_publisher=google&sc_category=core&sc_country=IT&sc_geo=EMEA&sc_outcome=Acquisition&sc_detail=%2Baws%20%2Bfree&sc_content=Cost_bmm&sc_matchtype=b&sc_segment=455721528887&sc_medium=ACQ-P|PS-GO|Brand|Desktop|SU|AWS|Core|IT|EN|Text&s_kwcid=AL!4422!3!455721528887!b!!g!!%2Baws%20%2Bfree&ef_id=Cj0KCQjwlvT8BRDeARIsAACRFiW9L8Pday3clCH_UdQml3klBzGcZ5Pdy6bebFxcqndUFKA70qN892oaArbdEALw_wcB:G:s&s_kwcid=AL!4422!3!455721528887!b!!g!!%2Baws%20%2Bfree&all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc): you have access to a 12 months free tier program

### Install AWS CLI
- If you already installed AWS CLI version1, follow the instructions [here](https://docs.aws.amazon.com/cli/latest/userguide/install-macos.html#install-macosos-bundled-uninstall) to uninstall it
- Install the latest AWS CLI version 2 using MacOS command line by entering:
  - `$ curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"`
  - `sudo installer -pkg AWSCLIV2.pkg -target /`
  - see detailed instructions [here](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html#cliv2-mac-install-cmd)
- Verify the installation:
  - enter `$ which aws` which should return "/usr/local/bin/aws"
  - enter `$ aws --version` which should return at least "aws-cli/2.0.61 Python/3.7.4 Darwin/19.6.0 exe/x86_64" (at the time of writign this file)
- Detailed instructions and more options can be found [here](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html#cliv2-mac-install-cmd)

### Configure AWS CLI
Configure your AWS CLI with your AWS credentials (use your root if you just created your account, or an existing IAM user account):
- enter `$ aws configure`
- insert your account ID and Access Key ID, which you can find [here](https://console.aws.amazon.com/iam/home?#/security_credentials)
- enter your default region
- press enter for the default output format

### Create and cd into a new folder which will contain your code
After creating and entering your folder, sync it with your remote repo (see [this article](https://github.com/apprenticecto/create-your-github-account-and-repo-macos) to set it on Github).

You can fork this repo if you wish.

If you don't, do not forget to add a .gitignore file (see contents in this repo), to avoid versioning state information and large files, which might fail.

### Create a IAM user
Following [AWS best practices on IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html):
- logon to your aws account
- create an IAM user, with programmatic access (i.e. via AWS APIs)
- create an 'admin' group with 'Full Access EC2' policy attached
- add the user to the admin group

### Create and destroy an EC2
The file `ec2_instance.tf` contains the Terraform code to create (and then destroy) an ec2 instance, with a specific [Amazon Machine Image](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html).

Run `terraform apply` to create the specified instance on your AWS account.

Run `terraform destroy` to create the specified instance on your AWS account.

### Commit and push your code to your remote repo
After successfully destroying your instance:
- commit your code
- push your committed code to your remote repo