resource "aws_iam_policy" "policy" {
  name        = "${local.aws_iam_policy_name}-policy"
  description = "My tf-test policy"
  policy      = data.aws_iam_policy_document.tf-example.json
}

data "aws_iam_policy_document" "tf-example" {
  statement {
    actions   = ["s3:GetObject", "s3:GetObjectVersion"]
    resources = ["${local.s3_bucket_arn}/*"]
    effect    = "Allow"
  }
  statement {
    actions   = ["s3:GetObject", "s3:GetObjectVersion"]
    resources = [local.s3_bucket_arn]
    effect    = "Allow"
  }
}
