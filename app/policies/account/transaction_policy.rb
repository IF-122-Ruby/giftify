class Account::TransactionPolicy < Struct.new(:user, :admin)
  def create?
    user
  end
end
  