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

resource "aws_iam_user" "developerUser" {
  name = "secondperson"
  path = "/"
  force_destroy = true
}

resource "aws_iam_user_group_membership" "developergroup" {
  user = aws_iam_user.developerUser.name
  groups = [
    aws_iam_group.developers.name,
  ]
}

resource "aws_iam_user_policy_attachment" "admin-access" {
  user       = aws_iam_user.trialUser.name
  policy_arn = aws_iam_policy.trialAdminpolicy.arn
}

resource "aws_iam_group_policy" "trialDeveloperPolicy" {
  name = "trialDevelopers"
  group = aws_iam_group.developers.name
  policy = file("developer-policy.json")
}

resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/developers/"
}