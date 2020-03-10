class Admin::BaseController < ApplicationController
  #Shared logic here
  before_filter :authenticate_user!
end
