require "spec_helper"

describe WoodsController do
  describe "routing" do

    it "routes to #index" do
      get("/woods").should route_to("woods#index")
    end

    it "routes to #new" do
      get("/woods/new").should route_to("woods#new")
    end

    it "routes to #show" do
      get("/woods/1").should route_to("woods#show", :id => "1")
    end

    it "routes to #edit" do
      get("/woods/1/edit").should route_to("woods#edit", :id => "1")
    end

    it "routes to #create" do
      post("/woods").should route_to("woods#create")
    end

    it "routes to #update" do
      put("/woods/1").should route_to("woods#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/woods/1").should route_to("woods#destroy", :id => "1")
    end

  end
end
