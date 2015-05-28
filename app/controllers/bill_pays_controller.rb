class BillPaysController < ApplicationController
  before_filter :require_login, :check_admin
  before_filter :set_bill, only: [:new, :edit, :update, :destroy]

  def index
    @accounts = LedgerAccount.where(active: true, account_type: 'D')
    @paid     = BillToPay.paid
    @pendent  = BillToPay.pending
  end

  def new
    @bill = BillToPay.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
    def set_bill
      @bill = BillToPay.find params[:id]
    end

    def bill_params
    end

end
