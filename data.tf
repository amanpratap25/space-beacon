data "aws_availability_zones" "available" {
  state = "available"
}

data "archive_file" "init" {
  type        = "zip"
  source_dir  = "./Flask"
  output_path = "flask.zip"
}