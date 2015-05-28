class DependentsController < ApplicationController
  before_filter :require_login, :check_admin

  def index

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def set_dependent
      @dependent = Dependent.find params[:id]
    end

end
