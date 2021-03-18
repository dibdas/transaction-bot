# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.includes(:user).where(user_id: current_user.id).joins(:groups)
    @total = Transaction.where(user_id: current_user.id).joins(:groups).sum(:amount)
  end

  # GET /transactions/1 or /transactions/1.json
  def show; end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = current_user.transactions.build(transaction_params)
    if @transaction.save
      group_id = params[:transaction][:group_id]
      TransactionsGroup.create(group_id: group_id, transaction_id: @transaction.id) if group_id
      flash[:success] = 'You created new payment'
      redirect_to root_path
    else
      render :new
    end
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    transaction = Transaction.find(params[:id])
    if @transaction.update(transaction_params)
      flash[:success] = 'Transaction was successfully updated.'
    else
      render :edit

    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:name, :amount, :user_id)
  end
end
