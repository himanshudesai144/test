resource "aws_iam_role" "test_role" {
  # name = "test_role"
  name = var.role_name_s
  assume_role_policy = data.aws_iam_policy_document.s3_role_policy.json
}



data "aws_iam_policy_document" "s3_role_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }
  }
}


resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.test_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

data "aws_iam_policy_document" "example" {
  statement {
    effect = "Allow"
    actions = [
      "s3:*",
      "s3-object-lambda:*"
    ]
    resources = [
      "*",
    ]
  }

  }
resource "aws_iam_policy" "example" {
  # name        = "s3-inline_terraform"
   name = var.policy_name
  policy = data.aws_iam_policy_document.example.json
}

resource "aws_iam_role_policy_attachment" "test-attachrole" {
  role       = aws_iam_role.test_role.name
  policy_arn = aws_iam_policy.example.arn
}