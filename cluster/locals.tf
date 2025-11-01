locals {
    bash_user_arn    = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/workshop-out-user"
    console_user_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/devops-user"
}