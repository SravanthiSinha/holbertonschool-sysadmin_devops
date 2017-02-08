#!/usr/bin/env ruby

require 'aws-sdk'
require 'yaml'
require 'optparse'
require 'ostruct'

class AWSClient

  @@s3
  def intialize
    pass
  end

  def connect(filename)
    # load credentials from disk
    creds= YAML.load(File.read(filename))
    Aws.config.update({
                        region: creds['region'],
                        credentials: Aws::Credentials.new(creds['access_key_id'], creds['secret_access_key'])})
    @@s3 = Aws::S3::Resource.new
    @@s3client = Aws::S3::Client.new
                      
  end
  
  def list(bucketname=nil)
    if bucketname
      @@s3.bucket(bucketname).objects.each do |object|
        puts "#{object.key} => #{object.etag}"
      end
    else
      resp = @@s3client.list_buckets
      puts resp.buckets.map(&:name)
     end
  end
  
  def upload(filepath,bucketname)
    @@s3.bucket(bucketname).object(File.basename(filepath)).upload_file(filepath)
  end
  
  def delete(filepath,bucketname)
    @@s3.bucket(bucketname).object(File.basename(filepath)).delete
  end

  def download(filepath,bucketname)
    @@s3.bucket(bucketname).object(File.basename(filepath)).get(response_target: filepath)
  end
  
  def size(bucketname)
    sum =0
    @@s3.bucket(bucketname).objects.each do |obj|
      sum += obj.size
    end
    mo = (sum/1048576.0).round(2)
    puts "#{mo}Mo"
  end
   
end

class Optparse
  
  @@params = OpenStruct.new

  def initialize(argv)
    parse(ARGV)
  end  
  def parse(args)
    options = OpenStruct.new

    options.action = nil
    options.verbose = false
    options.bucketname = nil
    options.filepath = nil
    
    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: s3_script.rb [options]"

      # Boolean switch.
      opts.on("-v", "--verbose", "Run verbosely") do |v|
        options.verbose = true
      end

      opts.on("-b", "--bucketname=BUCKET_NAME", "Name of the bucket to perform the action on") do |v|
        options.bucketname = v
      end
      
      opts.on("-f", "--filepath=FILE_PATH", "Path to the file to upload") do |v|
        options.filepath = v
      end
      
      opts.on("-a", "--action=ACTION", "Select action to perform [list, upload, delete, download,size]") do |v|
        options.action = v
      end

      if ARGV[1] == '-h' || ARGV[1] == '--help'
        puts opts
        exit
      end
    end

    opt_parser.parse!(args)
    @@params = options
    options
  end  # parse()

  def getparams()
    @@params
  end

end# class Optparse


def handleAction(options)
  my_client = AWSClient.new
  my_client.connect("config.yaml")
  case options.action
  when 'list'
    my_client.list(options.bucketname)
  when 'upload'
    my_client.upload(options.filepath,options.bucketname)
  when 'delete'
    my_client.delete(options.filepath,options.bucketname)
  when 'download'
    my_client.download(options.filepath,options.bucketname)
  when 'size'
    my_client.size(options.bucketname)
  end
end

if ARGV.length()
  options = Optparse.new(ARGV)
  handleAction(options.getparams())
end

