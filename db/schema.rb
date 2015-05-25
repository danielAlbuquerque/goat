# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150524200139) do

  create_table "access_denieds", force: :cascade do |t|
    t.integer  "member_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "log",        limit: 30, null: false
  end

  add_index "access_denieds", ["created_at"], name: "index_access_denieds_on_created_at", using: :btree
  add_index "access_denieds", ["log"], name: "index_access_denieds_on_log", using: :btree
  add_index "access_denieds", ["member_id"], name: "index_access_denieds_on_member_id", using: :btree

  create_table "account_transfers", force: :cascade do |t|
    t.integer  "member_id",           limit: 4,                    null: false
    t.integer  "ledger_account_c_id", limit: 4,                    null: false
    t.integer  "ledger_account_d_id", limit: 4,                    null: false
    t.decimal  "value",                             precision: 10, null: false
    t.text     "reason",              limit: 65535
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.datetime "deleted_at"
  end

  add_index "account_transfers", ["deleted_at"], name: "index_account_transfers_on_deleted_at", using: :btree
  add_index "account_transfers", ["member_id"], name: "index_account_transfers_on_member_id", using: :btree

  create_table "bill_to_pays", force: :cascade do |t|
    t.integer  "payment_category_id", limit: 4,                    null: false
    t.integer  "member_id",           limit: 4,                    null: false
    t.integer  "ledger_account_id",   limit: 4,                    null: false
    t.string   "creditor",            limit: 100,                  null: false
    t.date     "emission",                                         null: false
    t.date     "maturity",                                         null: false
    t.decimal  "value",                             precision: 10, null: false
    t.date     "payment_date"
    t.text     "obs_bill",            limit: 65535
    t.text     "obs_payment",         limit: 65535
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.datetime "deleted_at"
  end

  add_index "bill_to_pays", ["deleted_at"], name: "index_bill_to_pays_on_deleted_at", using: :btree
  add_index "bill_to_pays", ["ledger_account_id"], name: "index_bill_to_pays_on_ledger_account_id", using: :btree
  add_index "bill_to_pays", ["member_id"], name: "index_bill_to_pays_on_member_id", using: :btree
  add_index "bill_to_pays", ["payment_category_id"], name: "index_bill_to_pays_on_payment_category_id", using: :btree

  create_table "bill_to_receives", force: :cascade do |t|
    t.integer  "payment_category_id", limit: 4,                    null: false
    t.integer  "member_id",           limit: 4,                    null: false
    t.integer  "ledger_account_id",   limit: 4,                    null: false
    t.string   "debtor",              limit: 100,                  null: false
    t.string   "reference",           limit: 100,                  null: false
    t.date     "emission",                                         null: false
    t.date     "maturity",                                         null: false
    t.decimal  "value",                             precision: 10, null: false
    t.date     "payment_date"
    t.text     "obs_bill",            limit: 65535
    t.text     "obs_payment",         limit: 65535
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.datetime "deleted_at"
  end

  add_index "bill_to_receives", ["deleted_at"], name: "index_bill_to_receives_on_deleted_at", using: :btree
  add_index "bill_to_receives", ["ledger_account_id"], name: "index_bill_to_receives_on_ledger_account_id", using: :btree
  add_index "bill_to_receives", ["member_id"], name: "index_bill_to_receives_on_member_id", using: :btree
  add_index "bill_to_receives", ["payment_category_id"], name: "index_bill_to_receives_on_payment_category_id", using: :btree

  create_table "cash_flows", force: :cascade do |t|
    t.integer  "cashier_id",         limit: 4,                    null: false
    t.integer  "member_id",          limit: 4,                    null: false
    t.integer  "ledger_account_id",  limit: 4,                    null: false
    t.integer  "form_of_payment_id", limit: 4,                    null: false
    t.string   "type",               limit: 1,                    null: false
    t.decimal  "value",                            precision: 10, null: false
    t.string   "description",        limit: 30,                   null: false
    t.text     "obs",                limit: 65535
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.datetime "deleted_at"
  end

  add_index "cash_flows", ["cashier_id"], name: "index_cash_flows_on_cashier_id", using: :btree
  add_index "cash_flows", ["deleted_at"], name: "index_cash_flows_on_deleted_at", using: :btree
  add_index "cash_flows", ["form_of_payment_id"], name: "index_cash_flows_on_form_of_payment_id", using: :btree
  add_index "cash_flows", ["ledger_account_id"], name: "index_cash_flows_on_ledger_account_id", using: :btree
  add_index "cash_flows", ["member_id"], name: "index_cash_flows_on_member_id", using: :btree

  create_table "cashiers", force: :cascade do |t|
    t.boolean  "opened",       limit: 1,                    default: true, null: false
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.decimal  "current_cash",               precision: 10, default: 0,    null: false
    t.string   "description",  limit: 50,                                  null: false
    t.text     "obs",          limit: 65535
    t.datetime "deleted_at"
  end

  add_index "cashiers", ["deleted_at"], name: "index_cashiers_on_deleted_at", using: :btree

  create_table "degrees", force: :cascade do |t|
    t.string   "description", limit: 30, null: false
    t.datetime "deleted_at"
  end

  add_index "degrees", ["deleted_at"], name: "index_degrees_on_deleted_at", using: :btree

  create_table "dependents", force: :cascade do |t|
    t.integer  "member_id",    limit: 4,   null: false
    t.string   "full_name",    limit: 100, null: false
    t.string   "relationship", limit: 1,   null: false
    t.string   "rg",           limit: 8,   null: false
    t.string   "cpf",          limit: 100
    t.date     "birth_date",               null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.datetime "deleted_at"
  end

  add_index "dependents", ["cpf"], name: "index_dependents_on_cpf", using: :btree
  add_index "dependents", ["deleted_at"], name: "index_dependents_on_deleted_at", using: :btree
  add_index "dependents", ["member_id"], name: "index_dependents_on_member_id", using: :btree
  add_index "dependents", ["relationship"], name: "index_dependents_on_relationship", using: :btree
  add_index "dependents", ["rg"], name: "index_dependents_on_rg", using: :btree

  create_table "document_types", force: :cascade do |t|
    t.string   "description", limit: 30, null: false
    t.datetime "deleted_at"
  end

  add_index "document_types", ["deleted_at"], name: "index_document_types_on_deleted_at", using: :btree

  create_table "documents", force: :cascade do |t|
    t.integer  "member_id",        limit: 4,   null: false
    t.integer  "document_type_id", limit: 4,   null: false
    t.integer  "degree_id",        limit: 4,   null: false
    t.string   "description",      limit: 200, null: false
    t.string   "password",         limit: 30,  null: false
    t.string   "file_name",        limit: 200, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.datetime "deleted_at"
  end

  add_index "documents", ["degree_id"], name: "index_documents_on_degree_id", using: :btree
  add_index "documents", ["deleted_at"], name: "index_documents_on_deleted_at", using: :btree
  add_index "documents", ["document_type_id"], name: "index_documents_on_document_type_id", using: :btree
  add_index "documents", ["member_id"], name: "index_documents_on_member_id", using: :btree

  create_table "evolution_grades", force: :cascade do |t|
    t.integer  "member_id",     limit: 4,     null: false
    t.integer  "old_degree_id", limit: 4,     null: false
    t.integer  "new_degree_id", limit: 4,     null: false
    t.date     "when",                        null: false
    t.text     "observation",   limit: 65535
    t.datetime "deleted_at"
  end

  add_index "evolution_grades", ["deleted_at"], name: "index_evolution_grades_on_deleted_at", using: :btree
  add_index "evolution_grades", ["member_id"], name: "index_evolution_grades_on_member_id", using: :btree
  add_index "evolution_grades", ["new_degree_id"], name: "index_evolution_grades_on_new_degree_id", using: :btree
  add_index "evolution_grades", ["old_degree_id"], name: "index_evolution_grades_on_old_degree_id", using: :btree
  add_index "evolution_grades", ["when"], name: "index_evolution_grades_on_when", using: :btree

  create_table "form_of_payments", force: :cascade do |t|
    t.string   "description", limit: 30, null: false
    t.datetime "deleted_at"
  end

  add_index "form_of_payments", ["deleted_at"], name: "index_form_of_payments_on_deleted_at", using: :btree

  create_table "glass_of_waters", force: :cascade do |t|
    t.integer  "session_id", limit: 4
    t.text     "members",    limit: 65535, null: false
    t.date     "when",                     null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.datetime "deleted_at"
  end

  add_index "glass_of_waters", ["deleted_at"], name: "index_glass_of_waters_on_deleted_at", using: :btree
  add_index "glass_of_waters", ["session_id"], name: "index_glass_of_waters_on_session_id", using: :btree

  create_table "inactive_reasons", force: :cascade do |t|
    t.integer  "member_id",  limit: 4,     null: false
    t.text     "reason",     limit: 65535, null: false
    t.date     "when",                     null: false
    t.datetime "deleted_at"
  end

  add_index "inactive_reasons", ["deleted_at"], name: "index_inactive_reasons_on_deleted_at", using: :btree
  add_index "inactive_reasons", ["member_id"], name: "index_inactive_reasons_on_member_id", using: :btree
  add_index "inactive_reasons", ["when"], name: "index_inactive_reasons_on_when", using: :btree

  create_table "ledger_accounts", force: :cascade do |t|
    t.boolean  "active",      limit: 1,  null: false
    t.string   "description", limit: 50, null: false
    t.string   "type",        limit: 1,  null: false
    t.datetime "deleted_at"
  end

  add_index "ledger_accounts", ["active"], name: "index_ledger_accounts_on_active", using: :btree
  add_index "ledger_accounts", ["deleted_at"], name: "index_ledger_accounts_on_deleted_at", using: :btree

  create_table "member_session", force: :cascade do |t|
    t.string   "session_id", limit: 255,   null: false
    t.text     "data",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "member_session", ["session_id"], name: "index_member_session_on_session_id", using: :btree
  add_index "member_session", ["updated_at"], name: "index_member_session_on_updated_at", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "cim",                 limit: 25,                                 null: false
    t.string   "first_name",          limit: 50,                                 null: false
    t.string   "last_name",           limit: 50,                                 null: false
    t.string   "email",               limit: 150,                                null: false
    t.string   "secondary_email",     limit: 150
    t.string   "cpf",                 limit: 14,                                 null: false
    t.string   "rg",                  limit: 10,                                 null: false
    t.date     "birth_date",                                                     null: false
    t.string   "workplace_company",   limit: 50
    t.string   "profession_company",  limit: 50
    t.integer  "degree_id",           limit: 4,                                  null: false
    t.date     "initiation_date",                                                null: false
    t.boolean  "active",              limit: 1,                  default: true
    t.decimal  "monthly_payment",                 precision: 10,                 null: false
    t.integer  "day_monthly_payment", limit: 4,                                  null: false
    t.integer  "position_held_id",    limit: 4
    t.string   "marital_status",      limit: 20,                                 null: false
    t.string   "phone1",              limit: 30,                                 null: false
    t.string   "phone2",              limit: 30
    t.string   "birth_uf",            limit: 2,                                  null: false
    t.string   "birth_city",          limit: 30,                                 null: false
    t.string   "address_uf",          limit: 2,                                  null: false
    t.string   "address_city",        limit: 30,                                 null: false
    t.string   "neighborhood",        limit: 50,                                 null: false
    t.string   "address_number",      limit: 20
    t.string   "address",             limit: 200,                                null: false
    t.string   "complement",          limit: 200
    t.string   "zipcode",             limit: 20
    t.boolean  "is_contact",          limit: 1,                  default: false, null: false
    t.string   "crypted_password",    limit: 255
    t.string   "password_salt",       limit: 255
    t.string   "persistence_token",   limit: 255
    t.integer  "login_count",         limit: 4
    t.integer  "failed_login_count",  limit: 4
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip",    limit: 15
    t.string   "last_login_ip",       limit: 15
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.datetime "deleted_at"
    t.boolean  "is_admin",            limit: 1,                  default: false
    t.string   "avatar",              limit: 100
  end

  add_index "members", ["active"], name: "index_members_on_active", using: :btree
  add_index "members", ["address_city"], name: "index_members_on_address_city", using: :btree
  add_index "members", ["address_uf"], name: "index_members_on_address_uf", using: :btree
  add_index "members", ["cim"], name: "index_members_on_cim", using: :btree
  add_index "members", ["cpf"], name: "index_members_on_cpf", using: :btree
  add_index "members", ["day_monthly_payment"], name: "index_members_on_day_monthly_payment", using: :btree
  add_index "members", ["degree_id"], name: "index_members_on_degree_id", using: :btree
  add_index "members", ["deleted_at"], name: "index_members_on_deleted_at", using: :btree
  add_index "members", ["email"], name: "index_members_on_email", using: :btree
  add_index "members", ["is_contact"], name: "index_members_on_is_contact", using: :btree
  add_index "members", ["monthly_payment"], name: "index_members_on_monthly_payment", using: :btree
  add_index "members", ["phone1"], name: "index_members_on_phone1", using: :btree
  add_index "members", ["position_held_id"], name: "index_members_on_position_held_id", using: :btree
  add_index "members", ["rg"], name: "index_members_on_rg", using: :btree

  create_table "members_sessions", id: false, force: :cascade do |t|
    t.integer  "member_id",  limit: 4
    t.integer  "session_id", limit: 4
    t.datetime "deleted_at"
  end

  add_index "members_sessions", ["deleted_at"], name: "index_members_sessions_on_deleted_at", using: :btree
  add_index "members_sessions", ["member_id"], name: "index_members_sessions_on_member_id", using: :btree
  add_index "members_sessions", ["session_id"], name: "index_members_sessions_on_session_id", using: :btree

  create_table "payment_categories", force: :cascade do |t|
    t.string   "description", limit: 50, null: false
    t.datetime "deleted_at"
  end

  add_index "payment_categories", ["deleted_at"], name: "index_payment_categories_on_deleted_at", using: :btree

  create_table "position_helds", force: :cascade do |t|
    t.string   "description", limit: 40, null: false
    t.datetime "deleted_at"
  end

  add_index "position_helds", ["deleted_at"], name: "index_position_helds_on_deleted_at", using: :btree

  create_table "session_types", force: :cascade do |t|
    t.string   "description", limit: 30, null: false
    t.datetime "deleted_at"
  end

  add_index "session_types", ["deleted_at"], name: "index_session_types_on_deleted_at", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.integer  "session_type_id", limit: 4,     null: false
    t.date     "when",                          null: false
    t.string   "schedule",        limit: 5,     null: false
    t.text     "minutes",         limit: 65535, null: false
    t.datetime "deleted_at"
  end

  add_index "sessions", ["deleted_at"], name: "index_sessions_on_deleted_at", using: :btree
  add_index "sessions", ["schedule"], name: "index_sessions_on_schedule", using: :btree
  add_index "sessions", ["session_type_id"], name: "index_sessions_on_session_type_id", using: :btree
  add_index "sessions", ["when"], name: "index_sessions_on_when", using: :btree

  add_foreign_key "access_denieds", "members"
  add_foreign_key "account_transfers", "members"
  add_foreign_key "bill_to_pays", "ledger_accounts"
  add_foreign_key "bill_to_pays", "members"
  add_foreign_key "bill_to_pays", "payment_categories"
  add_foreign_key "bill_to_receives", "ledger_accounts"
  add_foreign_key "bill_to_receives", "members"
  add_foreign_key "bill_to_receives", "payment_categories"
  add_foreign_key "cash_flows", "cashiers"
  add_foreign_key "cash_flows", "form_of_payments"
  add_foreign_key "cash_flows", "ledger_accounts"
  add_foreign_key "cash_flows", "members"
  add_foreign_key "documents", "degrees"
  add_foreign_key "documents", "document_types"
  add_foreign_key "documents", "members"
  add_foreign_key "evolution_grades", "members"
  add_foreign_key "glass_of_waters", "sessions"
  add_foreign_key "inactive_reasons", "members"
  add_foreign_key "members", "degrees"
  add_foreign_key "members", "position_helds"
  add_foreign_key "members_sessions", "members"
  add_foreign_key "members_sessions", "sessions"
  add_foreign_key "sessions", "session_types"
end
