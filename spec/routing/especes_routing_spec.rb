require "spec_helper"

describe EspecesController do
  describe "routing" do

    it "routes to #index" do
      get("/especes").should route_to("especes#index")
    end

    it "routes to #new" do
      get("/especes/new").should route_to("especes#new")
    end

    it "routes to #show" do
      get("/especes/1").should route_to("especes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/especes/1/edit").should route_to("especes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/especes").should route_to("especes#create")
    end

    it "routes to #update" do
      put("/especes/1").should route_to("especes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/especes/1").should route_to("especes#destroy", :id => "1")
    end

  end
end
