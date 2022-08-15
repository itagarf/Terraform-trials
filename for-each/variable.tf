variable "filename"{
    type = set(string)
    default = [
        "each1.txt",
        "each2.txt",
        "each3.txt"
    ]
}
variable "content"{
    default = "This is a mock content for this for_each files"
}