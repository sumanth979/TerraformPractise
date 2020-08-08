# Terraform Learnings
Practical Implementations of terraform for my Learning purpose.

### What is Terraform ..?
<p> Terraform is used to create, manage, and update infrastructure resources such as physical machines, VMs, network switches, containers, and more. Almost any infrastructure type can be represented as a resource in Terraform. </p>

<p> Terraform is an open-source infrastructure as code, software tool created by HashiCorp. It enables users to define and provision data center infrastructure using a declarative configuration language known as HashiCorp Configuration Language (HCL), or optionally JSON.</p>

For more information about Terraforms refer here - https://www.terraform.io/

### Terraform Providers ..?

<p> A provider is responsible for understanding API interactions and exposing resources. Providers generally are an IaaS (e.g. Alibaba Cloud, AWS, GCP, Microsoft Azure, OpenStack), PaaS (e.g. Heroku), or SaaS services (e.g. Terraform Cloud, DNSimple, Cloudflare). </p>

For more information about Terraform Providers refer here - https://www.terraform.io/docs/providers/index.html

### Terraform Implementations Commands

#### terraform init
To implement the provider of terraform.  It will download the associated plugins for initialzing the terraform provider.

#### terraform plan
The terraform plan command is used to create an execution plan. Terraform performs a refresh, unless explicitly disabled, and then determines what actions are necessary to achieve the desired state specified in the configuration files.

It will give the summary of additions, modifications and deletions with the template created.

#### terraform apply
To create all the resoruce in your AWS as per you plan.
Confirm the creation of resources with "yes".

#### terraform destroy
To destroy all the created resources.

#### terraform force-unlock <LOCK_ID>
To unlock the locked terraform forcefully. If the same terraform is running in some other terminal and forgot to close that. This command will help to forcefully close it.








