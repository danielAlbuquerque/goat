class Cashier < ActiveRecord::Base
  validates_presence_of :current_cash, :description
  has_many :cash_flows
  acts_as_paranoid

  scope :closed, lambda { where(opened: false) }

  def open
    self.open_with_value = self.current_cash
    self.description  = "Caixa aberto em #{Time.now} por #{Member.current.first_name}" unless description.present?
    self.save!

    dt = Time.now

    #Add CashFlow
    flow = CashFlow.new do |c|
      c.cashier_id        = id
      c.member_id         = Member.current.id
      c.ledger_account_id = 1
      c.flow_type         = "C"
      c.value             = current_cash
      c.when              = Time.now
      c.description       = "Caixa aberto em #{Time.now.strftime("%d/%m/%Y - %H:%M:%S")} por #{Member.current.first_name}"
    end
    flow.save!
  end

  def close
    self.opened    = false
    self.closed_at = Time.now
    self.save!
  end

  def self.current
    where(opened: true).first
  end

  def self.last_cash
    c = where(opened: false).order(:closed_at).last
    if c.present?
      c.current_cash
    else
      0
    end
  end

  def self.cash_update(cashier_id, tp, value)
    c = find cashier_id
    if tp == 'C'
      c.current_cash = c.current_cash + value
    else
      c.current_cash = c.current_cash - value
    end
    c.save
  end

  private
    def get_last_cashier
      where(opened: false).order(:closed_at).last
    end

end
