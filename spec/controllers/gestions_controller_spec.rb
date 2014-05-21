require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe GestionsController do

  # This should return the minimal set of attributes required to create a valid
  # Gestion. As you add validations to Gestion, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "gestion_date" => "2014-05-13" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GestionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all gestions as @gestions" do
      gestion = Gestion.create! valid_attributes
      get :index, {}, valid_session
      assigns(:gestions).should eq([gestion])
    end
  end

  describe "GET show" do
    it "assigns the requested gestion as @gestion" do
      gestion = Gestion.create! valid_attributes
      get :show, {:id => gestion.to_param}, valid_session
      assigns(:gestion).should eq(gestion)
    end
  end

  describe "GET new" do
    it "assigns a new gestion as @gestion" do
      get :new, {}, valid_session
      assigns(:gestion).should be_a_new(Gestion)
    end
  end

  describe "GET edit" do
    it "assigns the requested gestion as @gestion" do
      gestion = Gestion.create! valid_attributes
      get :edit, {:id => gestion.to_param}, valid_session
      assigns(:gestion).should eq(gestion)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Gestion" do
        expect {
          post :create, {:gestion => valid_attributes}, valid_session
        }.to change(Gestion, :count).by(1)
      end

      it "assigns a newly created gestion as @gestion" do
        post :create, {:gestion => valid_attributes}, valid_session
        assigns(:gestion).should be_a(Gestion)
        assigns(:gestion).should be_persisted
      end

      it "redirects to the created gestion" do
        post :create, {:gestion => valid_attributes}, valid_session
        response.should redirect_to(Gestion.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved gestion as @gestion" do
        # Trigger the behavior that occurs when invalid params are submitted
        Gestion.any_instance.stub(:save).and_return(false)
        post :create, {:gestion => { "gestion_date" => "invalid value" }}, valid_session
        assigns(:gestion).should be_a_new(Gestion)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Gestion.any_instance.stub(:save).and_return(false)
        post :create, {:gestion => { "gestion_date" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested gestion" do
        gestion = Gestion.create! valid_attributes
        # Assuming there are no other gestions in the database, this
        # specifies that the Gestion created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Gestion.any_instance.should_receive(:update).with({ "gestion_date" => "2014-05-13" })
        put :update, {:id => gestion.to_param, :gestion => { "gestion_date" => "2014-05-13" }}, valid_session
      end

      it "assigns the requested gestion as @gestion" do
        gestion = Gestion.create! valid_attributes
        put :update, {:id => gestion.to_param, :gestion => valid_attributes}, valid_session
        assigns(:gestion).should eq(gestion)
      end

      it "redirects to the gestion" do
        gestion = Gestion.create! valid_attributes
        put :update, {:id => gestion.to_param, :gestion => valid_attributes}, valid_session
        response.should redirect_to(gestion)
      end
    end

    describe "with invalid params" do
      it "assigns the gestion as @gestion" do
        gestion = Gestion.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Gestion.any_instance.stub(:save).and_return(false)
        put :update, {:id => gestion.to_param, :gestion => { "gestion_date" => "invalid value" }}, valid_session
        assigns(:gestion).should eq(gestion)
      end

      it "re-renders the 'edit' template" do
        gestion = Gestion.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Gestion.any_instance.stub(:save).and_return(false)
        put :update, {:id => gestion.to_param, :gestion => { "gestion_date" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested gestion" do
      gestion = Gestion.create! valid_attributes
      expect {
        delete :destroy, {:id => gestion.to_param}, valid_session
      }.to change(Gestion, :count).by(-1)
    end

    it "redirects to the gestions list" do
      gestion = Gestion.create! valid_attributes
      delete :destroy, {:id => gestion.to_param}, valid_session
      response.should redirect_to(gestions_url)
    end
  end

end