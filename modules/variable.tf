variable "policy_name" {
    type = string
    description = "aws iam policy"
    default = "s3-inline_terraform"  
}


variable "role_name_s" {
    type = string
    description = "aws iam role_name"
    default = "test_role"  
}
