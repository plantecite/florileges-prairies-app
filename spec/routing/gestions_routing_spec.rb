require "spec_helper"

describe GestionsController do
  describe "routing" do

    it "routes to #index" do
      get("/gestions").should route_to("gestions#index")
    end

    it "routes to #new" do
      get("/gestions/new").should route_to("gestions#new")
    end

    it "routes to #show" do
      get("/gestions/1").should route_to("gestions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/gestions/1/edit").should route_to("gestions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/gestions").should route_to("gestions#create")
    end

    it "routes to #update" do
      put("/gestions/1").should route_to("gestions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gestions/1").should route_to("gestions#destroy", :id => "1")
    end

  end
end
