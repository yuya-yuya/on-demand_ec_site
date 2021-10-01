require 'refile/s3'

if Rails.env.production? 
  aws = {
    access_key_id: "AKIATGUNARVZVNDLHKFS",
    secret_access_key: "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",
    region: 'ap-northeast-1', 
    bucket: "nagano-cake",
  }
  Refile.cache = Refile::S3.new(prefix: 'cache', **aws)
  Refile.store = Refile::S3.new(prefix: 'store', **aws)
end