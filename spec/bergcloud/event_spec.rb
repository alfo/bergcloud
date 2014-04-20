require 'spec_helper'

describe BERGCloud::Event do

  it "should initialize the event_id" do
    event_id = 'something'
    event = BERGCloud::Event.new(event_id)
    event.event_id.should == event_id
  end

  it "should return a hash for for event info" do
    BERGCloud.api_token = API_TOKEN
    event = BERGCloud::Event.new('12345')
    event.info.should be_an_instance_of Hash
  end

end
