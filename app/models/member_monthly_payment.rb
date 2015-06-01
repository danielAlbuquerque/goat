class MemberMonthlyPayment < ActiveRecord::Base
  #Paranoid
  acts_as_paranoid
  belongs_to :member

  def self.process_current_mounth
    has_been = self.find_by_reference(Time.now.strftime("%Y%m"))
    if has_been && has_been.total_processed == Member.actives.count
      self.run_current_again
    else
      self.run_current
    end
  end

  private
    def self.run_current_again
      processed = 0
      time      = Time.new

      Member.actives.each do |member|

        day   = member.day_monthly_payment
        value = member.monthly_payment

        has_been = BillToReceive.find_by_payment_category_id_and_member_id_and_ledger_account_id_and_date_to_payment(1, member.id, 3, Date.new(Time.now.year, Time.now.month, day.to_i))

        unless has_been
          b = BillToReceive.new do |bill|
            bill.payment_category_id = 1
            bill.member              = member
            bill.ledger_account_id   = 3
            bill.maturity            = time.end_of_month
            bill.date_to_payment     = Date.new Time.now.year, Time.now.month, day.to_i
            bill.debtor              = member.first_name + " " + member.last_name
            bill.reference           = "Mensalidade de #{Time.now.strftime("%Y/%m")}"
            bill.monthly_ref         = Time.now.strftime("%Y%m")
            bill.emission            = Time.now
            bill.value               = value
            bill.obs_bill            = "Mensalidade"
          end
          b.save

          processed = processed + 1
        end
      end

      _processed_by = Member.current.present? ? "Processado por " + Member.current.first_name + " " + Member.current_last_name : "Processado pelo sistema"
      monthly       = MemberMonthlyPayment.find_by_reference(Time.now.strftime("%Y%m"))
      total         = BillToReceive.where(payment_category_id: 1, ledger_account_id: 3, monthly_ref: Time.now.strftime("%Y%m")).sum(:value)

      if monthly.present?
        monthly.processed_by     = _processed_by
        monthly.total_to_receive = total
        monthly.total_processed  = processed
        monthly.save!
      else
        self.create reference: Time.now.strftime("%Y%m"), processed_by: _processed_by, total_to_receive: total, total_processed: processed
      end


    end

    def self.run_current
      processed = 0
      time      = Time.new

      Member.actives.each do |member|

        day   = member.day_monthly_payment
        value = member.monthly_payment

        b = BillToReceive.new do |bill|
          bill.payment_category_id = 1
          bill.member              = member
          bill.ledger_account_id   = 3
          bill.maturity            = time.end_of_month # always last day of month
          bill.date_to_payment     = Date.new Time.now.year, Time.now.month, day.to_i
          bill.debtor              = member.first_name + " " + member.last_name
          bill.reference           = "Mensalidade de #{Time.now.strftime("%Y/%m")}"
          bill.monthly_ref         = Time.now.strftime("%Y%m")
          bill.emission            = Time.now
          bill.value               = value
          bill.obs_bill            = "Cobrança de mensalidade"
        end
        b.save!

        processed = processed + 1
      end
      total = BillToReceive.where(payment_category_id: 1, ledger_account_id: 3, monthly_ref: Time.now.strftime("%Y%m")).sum(:value)
      _processed_by = Member.current.present? ? "Processado por " + Member.current.first_name + " " + Member.current_last_name : "Processado pelo sistema"
      self.create reference: Time.now.strftime("%Y%m"), processed_by: _processed_by, total_to_receive: total, total_processed: processed
    end
end
