resource "null_resource" "connection" {
  triggers = {
    src_hash = "${data.archive_file.init.output_sha}"
  }
  provisioner "local-exec" {
    command    = "aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 346882428534.dkr.ecr.eu-west-2.amazonaws.com"
    on_failure = continue
  }
}


resource "null_resource" "docker_build" {
  triggers = {
    src_hash = "${data.archive_file.init.output_sha}"
  }

  provisioner "local-exec" {
    command = <<EOT
      docker build -t my-ecr-repo ./Flask
    EOT
  }

  depends_on = [
    null_resource.connection
  ]
}

resource "null_resource" "tag" {
  triggers = {
    src_hash = "${data.archive_file.init.output_sha}"
  }
  provisioner "local-exec" {
    command    = "docker tag my-ecr-repo:latest 346882428534.dkr.ecr.eu-west-2.amazonaws.com/my-ecr-repo:latest"
    on_failure = continue
  }

  depends_on = [
    null_resource.docker_build
  ]
}

resource "null_resource" "push" {
  triggers = {
    src_hash = "${data.archive_file.init.output_sha}"
  }
  provisioner "local-exec" {
    command    = "docker push 346882428534.dkr.ecr.eu-west-2.amazonaws.com/my-ecr-repo:latest"
    on_failure = continue
  }
  depends_on = [
    null_resource.tag
  ]
}