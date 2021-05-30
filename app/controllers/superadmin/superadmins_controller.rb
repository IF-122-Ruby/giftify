class Superadmin::SuperadminsController < ApplicationController
  before_action :authenticate_user!
end