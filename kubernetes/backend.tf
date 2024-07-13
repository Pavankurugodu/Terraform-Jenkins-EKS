terraform{
    backend "s3" {
        bucket = "terraform-jenkins-eks-bucket01"
        region ="ap-south-1"
        key    ="eks/terraform.tfstate"     
    }
}