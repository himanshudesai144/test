#  for_each with set and list


variable "projects" {
  type        = set(string)
  default     = ["test-project-1", "test-project-2", "test-project-3"]
}

resource "aws_s3_bucket" "bucket" {
  for_each  = var.projects

  bucket = "bucket-${each.value}"
}
#################################
variable "projects" {
  type        = list(string)
  default     = ["test-project-1", "test-project-2", "test-project-3"]
}

resource "aws_s3_bucket" "bucket" {
  for_each  = toset(var.projects)

  bucket = "bucket-${each.value}"
}


## incorrect

output "bucket_names" {
  value       = aws_s3_bucket.bucket[*].id 
}


## correct
output "bucket_names" {
  value       = values(aws_s3_bucket.bucket)[*].id 
}


#######################################################
#  for_each with map

variable "projects" {
  type  = map(string)
  default = {
    "test-project-1" = "Test Project 1",
    "test-project-2" = "Test Project 2",
    "test-project-3" = "Test Project 3",
  }
}

resource "aws_s3_bucket" "bucket" {
  for_each  = var.projects

  bucket   = "bucket-${each.key}"
  tags = {
    "Name" = each.value
  }
