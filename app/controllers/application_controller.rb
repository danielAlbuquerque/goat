class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_member_session, :current_member, :set_current_member, :check_admin
  before_filter :set_current_member

  private


    #Auth
  	def current_member_session
  		@current_member_session ||= MemberSession.find
  	end

  	def current_member
  		@current_member ||= current_member_session && current_member_session.member
  	end

    def require_login
      unless current_member
        store_location
        return redirect_to login_url, notice: "Você precisa estar logado para acessar o sistema"
      end
    end

    def store_location
      session[:return_to] = request.original_url
    end

    def set_current_member
      Member.current = current_member
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end


    #Access Control
    def check_admin
      unless Member.current.is_admin
        AccessDenied.create member: Member.current, log: request.original_url
        redirect_to root_path, notice: "Acesso negado"
      end
    end


end
