require "spec_helper"

describe RelevesController do
  describe "routing" do

    it "routes to #index" do
      get("/releves").should route_to("releves#index")
    end

    it "routes to #new" do
      get("/releves/new").should route_to("releves#new")
    end

    it "routes to #show" do
      get("/releves/1").should route_to("releves#show", :id => "1")
    end

    it "routes to #edit" do
      get("/releves/1/edit").should route_to("releves#edit", :id => "1")
    end

    it "routes to #create" do
      post("/releves").should route_to("releves#create")
    end

    it "routes to #update" do
      put("/releves/1").should route_to("releves#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/releves/1").should route_to("releves#destroy", :id => "1")
    end

  end
end
