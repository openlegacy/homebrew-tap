#! /usr/bin/env ruby

#
# Load OL project release data into Homebrew Formula template
#

require "erb"
require "open-uri"

# vars supplied by CI
project = ENV['OL_PROJECT_NAME']
version = ENV['OL_REVISION']
s3_bucket = ENV['OL_PUBLIC_BUCKET']
className = ENV['FORMULA_CLASSNAME']

# Return the URL, and SHA for a project
def get_latest_release(s3_bucket, project, version)
  url = "https://#{s3_bucket}.s3.amazonaws.com/#{project}/#{version}/linux-macos/#{project}.zip"
  sha_url = "https://#{s3_bucket}.s3.amazonaws.com/#{project}/#{version}/linux-macos/#{project}.sha256"
  sha_data = URI.parse(sha_url).read
  sha256 = sha_data.split(" ").first
  return url, sha256
end

url, sha256 = get_latest_release(s3_bucket, project, version)

template = File.read("template.erb")
render = ERB.new(template)
puts render.result()
