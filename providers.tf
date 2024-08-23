provider "aws" {
  for_each = toset(var.regions)
  alias    = each.key
  region   = each.value
}
