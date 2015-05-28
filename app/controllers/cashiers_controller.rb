class CashiersController < ApplicationController

  before_filter :require_login
  before_filter :check_admin
  before_filter :set_current, only: [:index, :open, :close]

  def index
    @closed = Cashier.closed
    @cash_flow = CashFlow.new cashier: @current
  end

  def open
    if @current.present?
      redirect_to :index, notice: "Já existe um caixa em aberto"
    end

    if request.post?
      @cashier = Cashier.new cashier_params
      @cashier.open
      redirect_to action: :index, notice: "Caixa aberto com sucesso"
    else
      @cashier = Cashier.new
      @cashier.current_cash = Cashier.last_cash
    end
  end

  def close
    unless @current.present?
      redirect_to "/cashiers/", notice: "O caixa já está fechado"
    end
    @current.close
    redirect_to "/cashiers/", notice: "Caixa fechado com sucesso!"
  end



  private
    def set_current
      @current = Cashier.current
    end

    def cashier_params
      params.require(:cashier).permit(:description, :current_cash)
    end

end
