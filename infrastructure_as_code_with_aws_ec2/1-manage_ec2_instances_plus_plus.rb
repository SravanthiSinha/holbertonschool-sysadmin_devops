#!/usr/bin/env ruby

require 'aws-sdk'
require 'yaml'
require 'optparse'
require 'ostruct'

class AWSClient

  @@ec2
  def intialize
    pass
  end
@@config
  def connect(filename)
    # load credentials from disk
    @@config= YAML.load(File.read(filename))
    Aws.config.update({
                        region: @@config['region'],
                        credentials: Aws::Credentials.new(@@config['access_key_id'], @@config['secret_access_key'])})
    @@client = Aws::EC2::Client.new
                      
  end
  
  def launch()
    ec2 = Aws::EC2::Resource.new(client: @@client)
    instance = ec2.create_instances({
                                      image_id: @@config["image_id"],
                                      min_count: 1,
                                      max_count: 1,
                                      key_name: @@config['key_pair'],
                                      security_group_ids: @@config["security_group_ids"],
                                      instance_type: @@config['instance_type'],
                                      placement: {
                                        availability_zone: @@config['availability-zone']
                                      }
                                    })
    # Wait for the instance to be created, running, and passed status checks
    ec2.client.wait_until(:instance_status_ok, {instance_ids: [instance[0].id]})
    inst = instance[0]
    inst.load()
    puts "#{inst.id},#{inst.public_dns_name}"
  end
  
  def stop(instance_id)
    @@client.stop_instances({
                            dry_run: false,
                            instance_ids: [instance_id],
                            force: false,
                          })
    
  end
  
  def start(instance_id)
    out = @@client.start_instances({
                                   instance_ids: [instance_id],
                                   dry_run: false,
                                 })
    out = @@client.wait_until(:instance_running, instance_ids:[instance_id])
    dns_name = out.reservations[0].instances[0].public_dns_name
    puts dns_name
  end

  def terminate(instance_id)
    @@client.terminate_instances({
                                 dry_run: false,
                                 instance_ids: [instance_id],
                               })
  end

  def status(instance_id)
    ec2 = Aws::EC2::Resource.new(client: @@client)
    i = ec2.instance(instance_id)
    if i.exists?
      puts i.state.name
    end
  end

  def change_name(instance_id,name)
    ec2 = Aws::EC2::Resource.new(client: @@client)
    i = ec2.instance(instance_id)
    if i.exists?
      i.create_tags({ tags: [{ key: 'Name', value: name }]})
    end
  end
     
end
$help
class Optparse
  
  @@params = OpenStruct.new

  def initialize(argv)
    parse(ARGV)
  end  
  def parse(args)
    options = OpenStruct.new

    options.action = nil
    options.verbose = false
    options.instance_id = nil
    options.name = nil
    
    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: aws_script.rb [options]"

            # Boolean switch.
      opts.on("-v", "--verbose", "Run verbosely") do |v|
        options.verbose = true
      end

      opts.on("-a", "--action=ACTION", "Select action to perform [launch, stop, start, terminate]") do |v|
        options.action = v
      end

      opts.on("-i", "--instance_id=INSTANCE_ID ", "ID of the instance to perform an action on") do |v|
        options.instance_id = v
      end
      
      opts.on("-n", "--name=INSTANCE_NAME", "Change the name of the instance") do |v|
        options.name = v
      end

      
      if ARGV[1] == '-h' || ARGV[1] == '--help'
        puts opts
        exit
      end
      $help =opts
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
  when 'launch'
    my_client.launch()
  when 'stop'
    my_client.stop(options.instance_id)
  when 'start'
    my_client.start(options.instance_id)
  when 'terminate'
    my_client.terminate(options.instance_id)
  when 'status'
    my_client.status(options.instance_id)
  when 'change_name'
    my_client.change_name(options.instance_id,options.name)
  else
    puts $help
  end
end

if ARGV.length()
  options = Optparse.new(ARGV)
  handleAction(options.getparams())
end

