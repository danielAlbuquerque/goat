class MemberSessionsController < ApplicationController

  before_filter :require_login, only: :destroy

  def new
  	@member_session = MemberSession.new
  end

  def create
  	@member_session = MemberSession.new params[:member_session]
  	if @member_session.save
  		redirect_to root_path
  	else
  		redirect_to login_path
  	end
  end

  def destroy
  	current_member_session.destroy
  	redirect_to login_path
  end
end
