data "local_file" "startup" {
  filename = "${path.module}/files/startup.sh"
}


resource "vultr_startup_script" "startup_ala" {
  name   = "advancedlsa"
  script = base64encode(data.local_file.startup.content)
}

data "vultr_startup_script" "script" {
  filter {
    name   = "name"
    values = ["advancedlsa"]
  }
}
