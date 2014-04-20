# BERGCloud

A gem for interacting with [BERG's Cloud API v2](http://bergcloud.com/devcenter/api/v2/cloud-v2)

## Installation

Add this line to your application's Gemfile:

    gem 'bergcloud'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bergcloud

## Usage

Get started:

```ruby
BERGCloud.api_token = 'your_api_token'
```

Project methods:

```ruby
project = BERGCloud::Project.new('your_project_id')

# Check if a project is valid
project.valid? #=> true or false

# Claim a device
project.claim('your-claim-code')

# Check a claim status
project.claim_status('your-claim-code')

# Send a command
project.send_command(:device_id => 'your_device_id', :name => 'my-command', :payload => [1, 2, 3])

# List devices
project.devices

# List events
project.events
```

Event methods:

```ruby
event = BERGCloud::Event.new('my-event-id')

# Get event information
event.info
```

Command methods:

```ruby
command = BERGCloud::Command.new('my-command-id')

# Get command info
command.info

# Remove a command from the queue
command.delete
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
