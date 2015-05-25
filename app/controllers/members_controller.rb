class MembersController < ApplicationController

	before_filter :require_login
	before_filter :check_admin

	def new
		@member = Member.new
	end

	def index
		@members = Member.order :first_name
	end

	def create
		@member = Member.new member_params
		if @member.save
			redirect_to :back, notice: "Membro cadastrado com sucesso!"
		else
			render :new, notice: "Ocorreu um erro ao cadastrar o membro"
		end
	end

	private
		def member_params
			params.require(:member).permit(
				:id, :cim, :first_name, :last_name, :email, :secondary_email, :cpf, :rg,
				:birth_date, :workplace_company, :profession_company, :degree_id, :initiation_date,
				:active, :monthly_payment, :day_monthly_payment, :position_held_id, :marital_status,
				:phone1, :phone2, :birth_uf, :birth_city, :address_uf, :address_city, :neighborhood,
				:address_number, :address, :complement, :zipcode, :is_contact,:crypted_password,
				:password_salt, :is_admin, :password, :password_confirmation
			)
		end



end
