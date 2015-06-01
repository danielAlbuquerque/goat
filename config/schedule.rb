every 1.minute do
  runner "MemberMonthlyPayment.process_current_mounth"
end
