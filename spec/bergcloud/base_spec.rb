require 'spec_helper'

describe BERGCloud do
  it "should store the API token correctly" do
    api_token = 'something'
    BERGCloud.api_token = api_token
    BERGCloud::Client.api_token.should == api_token
  end
end
