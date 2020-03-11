

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "put key here" # TODO: add in proper key. From created SSH key. this is likely needed in the main compute file rather than this sub folder
}
