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

{{ range (ds "regions") }}
#====== {{ .RegionName }}
provider "aws" {
  alias = "{{ .RegionName }}"

  region  = {{ if eq .OptInStatus "not-opted-in" }}contains(var.aws_regions, "{{ .RegionName }}") ? "{{ .RegionName }}" : "us-east-1"{{ else }}"{{ .RegionName }}"{{ end }}
  profile = var.aws_profile
}

module "{{ .RegionName }}" {
  source = "{{ include "source" }}"
  count  = contains(var.aws_regions, "{{ .RegionName }}") ? 1 : 0
  providers = {
    aws = aws.{{ .RegionName }}
  }

{{ template "variables" }}
}
{{ end }}

locals {
  results = {
{{- range (ds "regions") }}
    "{{ .RegionName }}" : module.{{ .RegionName }}[*],
{{- end }}
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
