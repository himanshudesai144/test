resource "aws_s3_bucket" "bucket" {
  count = 3

  bucket = "bucket-${count.index}"
}

# buckets named bucket-0, bucket-1, and bucket-2.

##########################################################

variable "projects" {
  type        = list(string)
  default     = ["test-project-1", "test-project-2", "test-project-3"]
}

resource "aws_s3_bucket" "bucket" {
  count = length(var.projects)

  bucket = "bucket-${var.projects[count.index]}"
}
#names “ bucket-test-project-1 ”, “ bucket-test-project-2 ”, and “ bucket-test-project-3 ”.

output "bucket_names" {
  value       = aws_s3_bucket.bucket[*].id 
}

#########################
variable "enabled" {
  type    = bool
  default = true
}

resource "aws_s3_bucket" "bucket" {
  count = var.enabled ? 1 : 0

  bucket = "bucket-test"
}
#  That is, if enabled = true then we create 1 bucket, if false – then 0.