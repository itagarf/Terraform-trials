resource "local_file" "each"{
    filename = each.value
    for_each = toset(var.filename)
    content = var.content
}