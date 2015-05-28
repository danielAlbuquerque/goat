class MemberSessionsController < ApplicationController

  before_filter :require_login, only: :destroy

  def new
    redirect_to root_path if current_member
  	@member_session = MemberSession.new
  end

  def create
  	@member_session = MemberSession.new params[:member_session]
  	if @member_session.save
  		redirect_to root_path
  	else
  		redirect_to login_path, notice: "Login inválido"
  	end
  end

  def destroy
    Member.current = nil
  	current_member_session.destroy
  	redirect_to login_path
  end
end
