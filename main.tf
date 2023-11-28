

module "iam" {
  source = "./modules"
  policy_name = "s3-inline_terraform1"
  role_name_s = "test_role1"
  
}


