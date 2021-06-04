class Users::EditorsController < ApplicationController
  def index
    @user = current_user
    p "show info about user"
    p current_user
  end
end