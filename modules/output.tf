output "role_name" {
    value = aws_iam_role.test_role.name
}

output "role_arn" {
    value = aws_iam_role.test_role.arn
}


output "policy_name" {
    value = aws_iam_policy.example.name
  
}


output "policy_id" {
    value = aws_iam_policy.example.id
  
}

output "policy_arn" {
    value = aws_iam_policy.example.arn
  
}