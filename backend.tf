terraform{
    backend "s3" {
        bucket = "terraform-jenkins-eks-bucket01"
        region ="ap-south-1"
        key    ="jenkins-server/terraform.tfstate"     
    }
}