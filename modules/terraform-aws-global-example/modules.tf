variable "aws_profile" {
  type        = string
  default     = "default"
  description = ""
}

variable "aws_regions" {
  type        = set(string)
  default     = ["us-west-2", "us-east-1"]
  description = ""
}


#====== ap-south-2
provider "aws" {
  alias = "ap-south-2"

  region  = contains(var.aws_regions, "ap-south-2") ? "ap-south-2" : "us-east-1"
  profile = var.aws_profile
}

module "ap-south-2" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "ap-south-2") ? 1 : 0
  providers = {
    aws = aws.ap-south-2
  }

  name   = var.name
  delete = var.delete
}

#====== ap-south-1
provider "aws" {
  alias = "ap-south-1"

  region  = "ap-south-1"
  profile = var.aws_profile
}

module "ap-south-1" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "ap-south-1") ? 1 : 0
  providers = {
    aws = aws.ap-south-1
  }

  name   = var.name
  delete = var.delete
}

#====== eu-south-1
provider "aws" {
  alias = "eu-south-1"

  region  = "eu-south-1"
  profile = var.aws_profile
}

module "eu-south-1" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "eu-south-1") ? 1 : 0
  providers = {
    aws = aws.eu-south-1
  }

  name   = var.name
  delete = var.delete
}

#====== eu-south-2
provider "aws" {
  alias = "eu-south-2"

  region  = contains(var.aws_regions, "eu-south-2") ? "eu-south-2" : "us-east-1"
  profile = var.aws_profile
}

module "eu-south-2" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "eu-south-2") ? 1 : 0
  providers = {
    aws = aws.eu-south-2
  }

  name   = var.name
  delete = var.delete
}

#====== me-central-1
provider "aws" {
  alias = "me-central-1"

  region  = contains(var.aws_regions, "me-central-1") ? "me-central-1" : "us-east-1"
  profile = var.aws_profile
}

module "me-central-1" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "me-central-1") ? 1 : 0
  providers = {
    aws = aws.me-central-1
  }

  name   = var.name
  delete = var.delete
}

#====== ca-central-1
provider "aws" {
  alias = "ca-central-1"

  region  = "ca-central-1"
  profile = var.aws_profile
}

module "ca-central-1" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "ca-central-1") ? 1 : 0
  providers = {
    aws = aws.ca-central-1
  }

  name   = var.name
  delete = var.delete
}

#====== eu-central-1
provider "aws" {
  alias = "eu-central-1"

  region  = "eu-central-1"
  profile = var.aws_profile
}

module "eu-central-1" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "eu-central-1") ? 1 : 0
  providers = {
    aws = aws.eu-central-1
  }

  name   = var.name
  delete = var.delete
}

#====== eu-central-2
provider "aws" {
  alias = "eu-central-2"

  region  = contains(var.aws_regions, "eu-central-2") ? "eu-central-2" : "us-east-1"
  profile = var.aws_profile
}

module "eu-central-2" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "eu-central-2") ? 1 : 0
  providers = {
    aws = aws.eu-central-2
  }

  name   = var.name
  delete = var.delete
}

#====== us-west-1
provider "aws" {
  alias = "us-west-1"

  region  = "us-west-1"
  profile = var.aws_profile
}

module "us-west-1" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "us-west-1") ? 1 : 0
  providers = {
    aws = aws.us-west-1
  }

  name   = var.name
  delete = var.delete
}

#====== us-west-2
provider "aws" {
  alias = "us-west-2"

  region  = "us-west-2"
  profile = var.aws_profile
}

module "us-west-2" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "us-west-2") ? 1 : 0
  providers = {
    aws = aws.us-west-2
  }

  name   = var.name
  delete = var.delete
}

#====== af-south-1
provider "aws" {
  alias = "af-south-1"

  region  = "af-south-1"
  profile = var.aws_profile
}

module "af-south-1" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "af-south-1") ? 1 : 0
  providers = {
    aws = aws.af-south-1
  }

  name   = var.name
  delete = var.delete
}

#====== eu-north-1
provider "aws" {
  alias = "eu-north-1"

  region  = "eu-north-1"
  profile = var.aws_profile
}

module "eu-north-1" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "eu-north-1") ? 1 : 0
  providers = {
    aws = aws.eu-north-1
  }

  name   = var.name
  delete = var.delete
}

#====== eu-west-3
provider "aws" {
  alias = "eu-west-3"

  region  = "eu-west-3"
  profile = var.aws_profile
}

module "eu-west-3" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "eu-west-3") ? 1 : 0
  providers = {
    aws = aws.eu-west-3
  }

  name   = var.name
  delete = var.delete
}

#====== eu-west-2
provider "aws" {
  alias = "eu-west-2"

  region  = "eu-west-2"
  profile = var.aws_profile
}

module "eu-west-2" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "eu-west-2") ? 1 : 0
  providers = {
    aws = aws.eu-west-2
  }

  name   = var.name
  delete = var.delete
}

#====== eu-west-1
provider "aws" {
  alias = "eu-west-1"

  region  = "eu-west-1"
  profile = var.aws_profile
}

module "eu-west-1" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "eu-west-1") ? 1 : 0
  providers = {
    aws = aws.eu-west-1
  }

  name   = var.name
  delete = var.delete
}

#====== ap-northeast-3
provider "aws" {
  alias = "ap-northeast-3"

  region  = "ap-northeast-3"
  profile = var.aws_profile
}

module "ap-northeast-3" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "ap-northeast-3") ? 1 : 0
  providers = {
    aws = aws.ap-northeast-3
  }

  name   = var.name
  delete = var.delete
}

#====== ap-northeast-2
provider "aws" {
  alias = "ap-northeast-2"

  region  = "ap-northeast-2"
  profile = var.aws_profile
}

module "ap-northeast-2" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "ap-northeast-2") ? 1 : 0
  providers = {
    aws = aws.ap-northeast-2
  }

  name   = var.name
  delete = var.delete
}

#====== me-south-1
provider "aws" {
  alias = "me-south-1"

  region  = "me-south-1"
  profile = var.aws_profile
}

module "me-south-1" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "me-south-1") ? 1 : 0
  providers = {
    aws = aws.me-south-1
  }

  name   = var.name
  delete = var.delete
}

#====== ap-northeast-1
provider "aws" {
  alias = "ap-northeast-1"

  region  = "ap-northeast-1"
  profile = var.aws_profile
}

module "ap-northeast-1" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "ap-northeast-1") ? 1 : 0
  providers = {
    aws = aws.ap-northeast-1
  }

  name   = var.name
  delete = var.delete
}

#====== sa-east-1
provider "aws" {
  alias = "sa-east-1"

  region  = "sa-east-1"
  profile = var.aws_profile
}

module "sa-east-1" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "sa-east-1") ? 1 : 0
  providers = {
    aws = aws.sa-east-1
  }

  name   = var.name
  delete = var.delete
}

#====== ap-east-1
provider "aws" {
  alias = "ap-east-1"

  region  = "ap-east-1"
  profile = var.aws_profile
}

module "ap-east-1" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "ap-east-1") ? 1 : 0
  providers = {
    aws = aws.ap-east-1
  }

  name   = var.name
  delete = var.delete
}

#====== ap-southeast-1
provider "aws" {
  alias = "ap-southeast-1"

  region  = "ap-southeast-1"
  profile = var.aws_profile
}

module "ap-southeast-1" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "ap-southeast-1") ? 1 : 0
  providers = {
    aws = aws.ap-southeast-1
  }

  name   = var.name
  delete = var.delete
}

#====== ap-southeast-2
provider "aws" {
  alias = "ap-southeast-2"

  region  = "ap-southeast-2"
  profile = var.aws_profile
}

module "ap-southeast-2" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "ap-southeast-2") ? 1 : 0
  providers = {
    aws = aws.ap-southeast-2
  }

  name   = var.name
  delete = var.delete
}

#====== ap-southeast-3
provider "aws" {
  alias = "ap-southeast-3"

  region  = contains(var.aws_regions, "ap-southeast-3") ? "ap-southeast-3" : "us-east-1"
  profile = var.aws_profile
}

module "ap-southeast-3" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "ap-southeast-3") ? 1 : 0
  providers = {
    aws = aws.ap-southeast-3
  }

  name   = var.name
  delete = var.delete
}

#====== ap-southeast-4
provider "aws" {
  alias = "ap-southeast-4"

  region  = contains(var.aws_regions, "ap-southeast-4") ? "ap-southeast-4" : "us-east-1"
  profile = var.aws_profile
}

module "ap-southeast-4" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "ap-southeast-4") ? 1 : 0
  providers = {
    aws = aws.ap-southeast-4
  }

  name   = var.name
  delete = var.delete
}

#====== us-east-1
provider "aws" {
  alias = "us-east-1"

  region  = "us-east-1"
  profile = var.aws_profile
}

module "us-east-1" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "us-east-1") ? 1 : 0
  providers = {
    aws = aws.us-east-1
  }

  name   = var.name
  delete = var.delete
}

#====== us-east-2
provider "aws" {
  alias = "us-east-2"

  region  = "us-east-2"
  profile = var.aws_profile
}

module "us-east-2" {
  source = "./modules/terraform-aws-s3-logbucket"
  count  = contains(var.aws_regions, "us-east-2") ? 1 : 0
  providers = {
    aws = aws.us-east-2
  }

  name   = var.name
  delete = var.delete
}


locals {
  results = {
    "ap-south-2" : module.ap-south-2[*],
    "ap-south-1" : module.ap-south-1[*],
    "eu-south-1" : module.eu-south-1[*],
    "eu-south-2" : module.eu-south-2[*],
    "me-central-1" : module.me-central-1[*],
    "ca-central-1" : module.ca-central-1[*],
    "eu-central-1" : module.eu-central-1[*],
    "eu-central-2" : module.eu-central-2[*],
    "us-west-1" : module.us-west-1[*],
    "us-west-2" : module.us-west-2[*],
    "af-south-1" : module.af-south-1[*],
    "eu-north-1" : module.eu-north-1[*],
    "eu-west-3" : module.eu-west-3[*],
    "eu-west-2" : module.eu-west-2[*],
    "eu-west-1" : module.eu-west-1[*],
    "ap-northeast-3" : module.ap-northeast-3[*],
    "ap-northeast-2" : module.ap-northeast-2[*],
    "me-south-1" : module.me-south-1[*],
    "ap-northeast-1" : module.ap-northeast-1[*],
    "sa-east-1" : module.sa-east-1[*],
    "ap-east-1" : module.ap-east-1[*],
    "ap-southeast-1" : module.ap-southeast-1[*],
    "ap-southeast-2" : module.ap-southeast-2[*],
    "ap-southeast-3" : module.ap-southeast-3[*],
    "ap-southeast-4" : module.ap-southeast-4[*],
    "us-east-1" : module.us-east-1[*],
    "us-east-2" : module.us-east-2[*],
  }
}

output "results" {
  description = <<EOT
The outputs from each of the module for each of the enabled AWS regions.
EOT
  value = {
    for key, value in local.results :
    key => value[0] if length(value) > 0
  }
}
