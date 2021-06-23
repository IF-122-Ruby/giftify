class Account::AccountsController < ApplicationController
  before_action :authenticate_user!
  helper_method :current_organization
  layout "admin"

  private

  def current_organization
    @current_organization ||= current_user.organization
  end
end
