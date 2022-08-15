terraform {
  required_providers {
    local = {
        source = "hashicorp/local"
        version = "> 2.0.0, <2.2.3, !=1.4.0" #or "!= 1.4.0" or ">1.4.0" or "<1.4.0" or "~1.2"
    }
  }
}
resource "local_file" "versions"{
    filename = "versions.txt"
    content = "This is a random rubbish or a mock content! You can ignore if you like, or you can read it."
}