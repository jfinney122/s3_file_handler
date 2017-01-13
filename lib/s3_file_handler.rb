require 's3_file_handler/version'
require 'aws-sdk'

class S3FileHandler
  attr_reader :s3, :options, :file_object
  delegate :body, to: :get

  def initialize(bucket, file_key, region = 'us-east-1', file_object = nil)
    @s3 = Aws::S3::Client.new(region: region)
    @options = { bucket: bucket, key: file_key }
    @file_object = file_object
  end

  def put
    s3.put_object(options, body: file_object)
  end

  def get(path_or_io = nil)
    options[:response_target] = path_or_io if path_or_io
    s3.get_object(options)
  end

  def stream
    body.read
  end

  def to_csv(csv_options)
    CSV.new(stream, csv_options).read
  end
end
