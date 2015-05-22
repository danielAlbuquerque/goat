class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|

      t.string :cim, null: false, limit: 25, index: true
      t.string :first_name, null: false, limit: 50
      t.string :last_name, null: false, limit: 50
      t.string :email, null: false, limit: 150, index: true
      t.string :secondary_email, limit: 150
      t.string :cpf, limit: 14, null: false, index: true
      t.string :rg, limit: 10, null: false, index: true
      t.date :birth_date, null: false
      t.string :workplace_company, limit: 50
      t.string :profession_company, limit: 50
      t.belongs_to :degree, index: true, null: false, foreign_key: true
      t.date :initiation_date, null: false
      t.boolean :active, default: true, index: true
      t.decimal :monthly_payment, null: false, index: true
      t.integer :day_monthly_payment, null: false, index: true
      t.belongs_to :position_held, index: true, foreign_key: true
      t.string :marital_status, null: false, limit: 20
      t.string :phone1, null: false, limit: 30, index: true
      t.string :phone2, limit: 30
      t.string :birth_uf, limit: 2, null: false
      t.string :birth_city, limit: 30, null: false
      t.string :address_uf, limit: 2, null: false, index: true
      t.string :address_city, limit: 30, null: false, index: true
      t.string :neighborhood, null: false, limit: 50
      t.string :address_number, limit: 20
      t.string :address, limit: 200, null: false
      t.string :complement, limit: 200
      t.string :zipcode, limit: 20
      t.boolean :is_contact, default: false, null: false, index: true

      # AUTHLOGIC
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.integer :login_count
      t.integer :failed_login_count
      t.datetime :last_request_at
      t.datetime :current_login_at
      t.datetime :last_login_at
      t.string :current_login_ip, limit: 15
      t.string :last_login_ip, limit: 15

      t.timestamps null: false
    end
  end
end
