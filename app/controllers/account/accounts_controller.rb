class Account::AccountsController < ApplicationController
  before_action :authenticate_user!
  # before_action :current_organization

  private
  def current_organization
    current_user.organization
  end
end