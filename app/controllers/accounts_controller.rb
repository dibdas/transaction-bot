class AccountsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /transactions or /transactions.json
  def index
    @account = current_user.accounts.all
    @accounts = Account.includes(:group).where(user_id: current_user.id)
    @total = Account.where(user_id: current_user.id).joins(:group).sum(:amount)
  end

  # GET /transactions/1 or /transactions/1.json
  def show; end

  # GET /transactions/new
  def new
    @account = Account.new
  end

  # POST /transactions or /transactions.json
  def create
    @account = current_user.accounts.build(account_params)
    if @account.save
      group_id = params[:account][:group_id]
      Account.create(group_id: group_id) if group_id
      flash[:success] = 'You created new payment'
      redirect_to root_path
    else
      render :new
    end
  end

  # GET /transactions/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    # transaction = Transaction.find(params[:id])
    if @account.update(account_params)
      flash[:success] = 'Transaction was successfully updated.'
    else
      render :edit

    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def external_transaction
    @external = current_user.accounts.where(group_id: nil)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @account = Account.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def account_params
    params.require(:account).permit(:name, :amount, :user_id, :group_id)
  end
end
