resource "aws_iam_user" "trialUser" {
  name = "firstperson"

  tags = {
    description = "The first person is the team leader"
  }
}

resource "aws_iam_policy" "trialAdminpolicy" {
  name   = "trialAdmins"
  policy = file("admin-policy.json")
}

resource "aws_iam_user_policy_attachment" "admin-access" {
  user       = aws_iam_user.trialUser.name
  policy_arn = aws_iam_policy.trialAdminpolicy.arn
}