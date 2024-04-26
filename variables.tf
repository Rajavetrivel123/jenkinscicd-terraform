variable "region" {
  type    = string
  default = "ap-south-1"
}
variable "ami_id" {
  type = map
  default = {
    ap-south-1    = "ami-007020fd9c84e18c7"
    ap-southeast-1    = "ami-06c4be2792f419b7b"
    ap-northeast-1 = "ami-0eba6c58b7918d3a1"
  }
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "key_name" {
  type    = string
  default = "dpp"
}
