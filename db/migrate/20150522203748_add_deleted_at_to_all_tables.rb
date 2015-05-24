class AddDeletedAtToAllTables < ActiveRecord::Migration
	AFFECTED_TABLES = [
		:account_transfers, :bill_to_pays, :bill_to_receives, :cash_flows, :cashiers, :degrees, :dependents,
		:documents, :document_types, :evolution_grades, :form_of_payments, :glass_of_waters, :inactive_reasons,
		:ledger_accounts, :members, :members_sessions, :payment_categories, :position_helds, :sessions, :session_types
	]

	def change
		AFFECTED_TABLES.each do |t|
			add_column t, :deleted_at, :timestamp
			add_index t, :deleted_at
		end
	end
end
