class CashFlowsController < ApplicationController
  before_filter :require_login, :check_admin
  def create
    @flow = CashFlow.new flow_params
    if @flow.launch
      redirect_to :back, notice: "Lançamento salvo"
    else
      redirect_to :back, notice: "Falha ao realizar lançamento"
    end
  end

  private
    def flow_params
      params.require(:cash_flow).permit(:description, :value, :member_id, :ledger_account_id, :flow_type, :when, :cashier_id)
    end
end
