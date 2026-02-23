variable "account_id" {
    description = "AWS account ID used in bucket naming."
    type        = string
}
variable "region" {
    description = "AWS region used in bucket naming."
    type        = string
}
variable "tags" {
  description = "Map of tags to apply to all resources (must include APPID and CreatedBy)."
  type        = map(string)
  default     = {}
}
