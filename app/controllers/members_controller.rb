class MembersController < ApplicationController

	before_filter :require_login
	before_filter :check_admin, except: [:members_list_public, :password_restore]
	before_filter :set_member, only: [:edit, :destroy, :show, :update, :password_restore]
	before_filter :set_combox, only: [:edit, :new]
	skip_before_filter :verify_authenticity_token, only: :destroy

	def new
		@member = Member.new
	end

	def index
		if params[:search].present?
			@members = Member.search(params[:search])
			@search = params[:search]
		else
			@members = Member.all_members
		end
	end

	def members_list_public
		@members = Member.actives
	end

	def destroy
		@member.destroy
		redirect_to :back, notice: "Membro excluído com sucesso"
	end

	def create
		@member = Member.new member_params
		if @member.save
			redirect_to members_path, notice: "Membro cadastrado com sucesso!"
		else
			set_combox
			render :new, notice: "Ocorreu um erro ao cadastrar o membro"
		end
	end

	def update
		if @member.update(member_params)
			redirect_to :members_path, notice: "Os dados do membro foram atualizados"
		else
			render :edit
		end
	end

	def show
	end

	def edit
	end

	def password_restore
	end

	private
		def member_params
			params.require(:member).permit(
				:id, :cim, :first_name, :last_name, :email, :secondary_email, :cpf, :rg,
				:birth_date, :workplace_company, :profession_company, :degree_id, :initiation_date,
				:active, :monthly_payment, :day_monthly_payment, :position_held_id, :marital_status,
				:phone1, :phone2, :birth_uf, :birth_city, :address_uf, :address_city, :neighborhood,
				:address_number, :address, :complement, :zipcode, :is_contact,:crypted_password,
				:password_salt, :is_admin, :password, :password_confirmation, :avatar
			)
		end

		def set_member
			@member = Member.find params[:id]
		end

		def set_combox
			@degrees = Degree.order :description
			@position_helds = PositionHeld.order :description
		end
end
