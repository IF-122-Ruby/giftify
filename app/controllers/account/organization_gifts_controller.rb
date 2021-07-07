class Account::OrganizationGiftsController < Account::AccountsController
  before_action :add_index_breadcrumb, only: :show

  def index
    @q = collection.paginate(page: params[:page], per_page: 9).ransack(params[:q])
    @gifts = @q.result
    add_breadcrumb('Organization Gifts')
  end

  def show
    @gift = resource
    add_breadcrumb(@gift.id)
  end

  private

  def collection
    current_organization.gifts
  end

  def resource
    collection.find(params[:id])
  end

  def add_index_breadcrumb
    add_breadcrumb('Organization Gifts', account_organization_gifts_path)
  end
end
