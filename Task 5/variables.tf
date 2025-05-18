variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Yandex Folder ID"
  type        = string
}

variable "zone" {
  description = "Zone (e.g. ru-central1-a)"
  type        = string
  default     = "ru-central1-a"
}

variable "image_id" {
  description = "ID образа (например, Ubuntu)"
  type        = string
  default     = "fd88o3huv4mm2jndnrl1"
}

variable "public_key_path" {
  description = "Путь до публичного SSH-ключа"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "yc_token" {
  description = "OAuth-токен для Yandex Cloud"
  type        = string
}

