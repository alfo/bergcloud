require 'spec_helper'

describe BERGCloud::Command do

  it "should initialize the command_id" do
    command_id = 'something'
    command = BERGCloud::Command.new(command_id)
    command.command_id.should == command_id
  end

  it "should return a hash for command info" do
    BERGCloud.api_token = API_TOKEN
    command = BERGCloud::Command.new('12345')
    command.info.should be_an_instance_of Hash
  end

  it "should return a hash when deleting a command" do
    BERGCloud.api_token = API_TOKEN
    command = BERGCloud::Command.new('12345')
    command.delete.should be_an_instance_of Hash
  end

end
