class DependentsController < ApplicationController
  before_filter :require_login, :check_admin
  before_filter :set_dependent, only: [:show, :edit, :update, :destroy]

  def index
    @member = Member.find params[:member_id]
    @dependents = Dependent.order(:full_name)
  end

  def new
  end

  def show
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
      @member = Member.find params[:member_id]
      @dependent = Dependent.find params[:id]
    end

end
