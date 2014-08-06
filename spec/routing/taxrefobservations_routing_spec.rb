require "spec_helper"

describe TaxrefobservationsController do
  describe "routing" do

    it "routes to #index" do
      get("/taxrefobservations").should route_to("taxrefobservations#index")
    end

    it "routes to #new" do
      get("/taxrefobservations/new").should route_to("taxrefobservations#new")
    end

    it "routes to #show" do
      get("/taxrefobservations/1").should route_to("taxrefobservations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/taxrefobservations/1/edit").should route_to("taxrefobservations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/taxrefobservations").should route_to("taxrefobservations#create")
    end

    it "routes to #update" do
      put("/taxrefobservations/1").should route_to("taxrefobservations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/taxrefobservations/1").should route_to("taxrefobservations#destroy", :id => "1")
    end

  end
end
