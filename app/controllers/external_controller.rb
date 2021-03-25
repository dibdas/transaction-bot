class ExternalController < ApplicationController
  before_action :authenticate_user!

  def home; end

  def external
    user = User.find_by(id: current_user.id)
    @external_for_user_transactions = user.accounts.where(group_id: nil).order(created_at: :desc)
    @external__for_total = @external_for_user_transactions.sum(:amount)
  end
end
