#!/usr/bin/env ruby

require 'aws-sdk'
require 'yaml'
require 'optparse'
require 'ostruct'

class AWSClient
  @@s3client
  @@s3resource
  def intialize
    pass
  end

  def connect(filename)
    # load credentials from disk
    creds= YAML.load(File.read(filename))
    Aws.config.update(
      region: creds['region'],
      access_key_id: creds['access_key_id'],
      secret_access_key: creds['secret_access_key'])

    @@s3client =Aws::S3::Client.new
    @@s3resource =Aws::S3::Resource.new
    
  end
  
  def list(bucketname)
    @@s3client.list_objects(bucket: bucketname).contents.each do |object|
      puts "#{object.key} => #{object.etag}"
    end
  end
  
  def upload(filepath,bucketname)
    @@s3resource.bucket(bucketname).object(File.basename(filepath)).upload_file(filepath)
  end
  
  def delete(filepath,bucketname)
    @@s3client.delete_object(key:filepath, bucket:bucketname)
  end

  def download(filepath,bucketname)
    File.open(filepath, 'wb') do |file|
      reap = @@s3client.get_object({ bucket:bucketname, key:filepath }, target: file)
    end
  end
   
end

class Optparse
  
  @@params = OpenStruct.new

  def initialize(argv)
    parse(ARGV)
  end  
  def parse(args)
    options = OpenStruct.new

    options.action = ''
    options.verbose = false
    options.bucketname =''
    options.filepath = ''
    
    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: s3_script.rb [options]"

      # Boolean switch.
      opts.on("-v", "--verbose", "Run verbosely") do |v|
        options.verbose = v
      end

      opts.on("-b", "--bucketname=BUCKET_NAME", "Name of the bucket to perform the action on") do |v|
        options.bucketname = v
      end
      
      opts.on("-f", "--filepath=FILE_PATH", "Path to the file to upload") do |v|
        options.filepath = v
      end
      
      opts.on("-a", "--action=ACTION", "Select action to perform [list, upload, delete, download]") do |v|
        options.action = v
      end

      # No argument, shows at tail.  This will print an options summary.
      # Try it and see!
      opts.on_tail('-h','--help') do
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
  end
end


options = Optparse.new(ARGV)



if ARGV.length()
  handleAction(options.getparams())
end

