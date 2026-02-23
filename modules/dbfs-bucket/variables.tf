variable "account_id" {}
variable "region" {}
variable "tags" {
  description = "Map of tags to apply to all resources (must include APPID and CreatedBy)."
  type        = map(string)
  default     = {}
}
