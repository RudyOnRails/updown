require 'spec_helper'

describe "root" do
  it "routes to Questions#index" do
    { :get => "/" }.should route_to("questions#index")
  end
end