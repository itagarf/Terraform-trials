resource "local_file" "dog" {
  filename        = "dog.txt"
  content         = "She said ${local_file.pet.content}"
  file_permission = "0730"
  lifecycle {
    create_before_destroy = true
  }
}
resource "local_file" "pet" {
  filename        = var.filename
  content         = var.content
  file_permission = "0700"
  depends_on = [
    random_pet.my-pet
  ]
}
resource "random_pet" "my-pet" {
  length = 1
}
output pet-name {
  value = random_pet.my-pet.id
  sensitive = false
  description = "This is the output of the random pet which is my pet!"
}
resource "random_pet" "new-pet" {
  prefix = "Mr"
  separator = "."
  length = "1"
}
resource "local_file" "new_tiger"{
  filename = "new_tiger.txt"
  content = data.local_file.tiger.content
  lifecycle {
    prevent_destroy = true
  }
}
data "local_file" "tiger"{
  filename = "tiger.txt"
}