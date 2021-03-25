class AccountsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @account = current_user.accounts.all
    @other_transaction = @account.where.not(group_id: nil)
    @accounts = @other_transaction.includes([:group]).sort_by(&:created_at).reverse

    @total = @other_transaction.sum(:amount)
  end

  def new
    @account = Account.new
  end

  def create
    @account = current_user.accounts.new(transaction_params)

    if @account.save

      if @account.group_id.nil?

        redirect_to external_transaction_path, notice: 'Transaction expense was successfully created.'

      else

        redirect_to accounts_path, notice: 'Transaction was successfully created.'

      end

    else

      render :new

    end
  end

  def show
    @account = Account.find(params[:id])
  end

  def edit
    @account = current_user.accounts.find(params[:id])
  end

  def update
    @transaction = current_user.accounts.find(params[:id])
    if @transaction.update(transaction_params)

      if @transaction.group_id.nil?

        redirect_to external_transaction_path, notice: 'external transaction was successfully updated.'
      else
        redirect_to accounts_path, notice: 'transaction was successfully updated.'
      end

    else
      render :edit
    end
  end

  def destroy
    @transaction = current_user.accounts.find(params[:id])
    @transaction.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_transaction
    @account = Account.find(params[:id])
  end

  def transaction_params
    params.require(:account).permit(:name, :amount, :group_id)
  end
end
