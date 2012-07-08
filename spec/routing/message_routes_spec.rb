require "spec_helper"

describe "routes for Messages" do
  it "routes /messages to the messages controller" do
    { :get => "/messages" }.should route_to(controller: "messages", action: "index")
  end

  it "routes / to the messages controller" do
    { :get => "/" }.should route_to(controller: "messages", action: "index")
  end

  it "routes POST /messages to the messages controller" do
    { :post => "/messages" }.should route_to(controller: "messages", action: "create")
  end

  it "routes /messages/:id.json to the messages controller" do
    { :get => "/messages/1.json" }.should route_to(controller: "messages", action: "show", id: "1", format: "json")
  end
end