require 'spec_helper'

describe BERGCloud::Project do
  it "should initialize the project_id" do
    project_id = 'something'
    proj = BERGCloud::Project.new(project_id)
    proj.project_id.should == project_id
  end

  it "should return true or false for valid?" do
    BERGCloud.api_token = API_TOKEN
    proj = BERGCloud::Project.new(PROJECT_ID)
    proj.valid?.should == !!proj.valid?
  end

  it "should return a hash for claiming a device" do
    BERGCloud.api_token = API_TOKEN
    proj = BERGCloud::Project.new(PROJECT_ID)
    proj.claim('test-token').should be_an_instance_of Hash
  end

  it "should return a hash for info about a claim" do
    BERGCloud.api_token = API_TOKEN
    proj = BERGCloud::Project.new(PROJECT_ID)
    proj.claim_status('test-token').should be_an_instance_of Hash
  end

  it "should return an array for a device list" do
    BERGCloud.api_token = API_TOKEN
    proj = BERGCloud::Project.new(PROJECT_ID)
    proj.devices.should be_an_instance_of Array
  end

  it "should return an array for an event list" do
    BERGCloud.api_token = API_TOKEN
    proj = BERGCloud::Project.new(PROJECT_ID)
    proj.events.should be_an_instance_of Array
  end

  it "should return raise an error unless all the options are included" do
    BERGCloud.api_token = API_TOKEN
    proj = BERGCloud::Project.new(PROJECT_ID)
    expect{proj.send_command(:a => 'b')}.to raise_error(BERGCloud::Error::ParamsError)
  end

  it "should not raise an error if all the options are included" do
    BERGCloud.api_token = API_TOKEN
    proj = BERGCloud::Project.new(PROJECT_ID)
    expect{proj.send_command(:payload => [1], :device_id => '123', :name => 'go')}.to_not raise_error(BERGCloud::Error::ParamsError)
  end

end
