variable "auth" {
    type = object({
        region = string
        assume_role_arn = string
    })

    default = {
        assume_role_arn = "arn:aws:iam::180294221572:role/WorkshopNaNuvemRole"
        region = "us-east-1"
    }
}

variable "tags" { 
    type = map(string)
    default = {
        Project = "eks-express"
        Environment = "Production"
    }
}

variable "karpenter" { 
    type = object({
        controller_role_name = string
        controller_policy_name = string
    })
    default = {
        controller_role_name = "KarpenterNodeRole-Production"   
        controller_policy_name =  "KarpenterControllerPolicy"
    }
}