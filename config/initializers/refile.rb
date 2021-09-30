require "refile/s3"

aws = {
  
  region: "ap-northeast-1",
  bucket: "nagano-cake",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)