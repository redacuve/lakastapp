class RecordsController < ApplicationController
  before_action :logged_in_user
  before_action :set_record, only: %i[show edit update destroy]

  def index
    @records = if params[:sort] == 'asc' || params[:sort] == 'desc'
                 Record.includes(:group).includes(:author).all.order_record(params[:sort])
               else
                 Record.includes(:group).includes(:author).all
               end
  end

  def allmyrecords
    @records = if params[:sort] == 'asc' || params[:sort] == 'desc'
                 Record.mine(current_user).includes(:group).grouped.order_record(params[:sort])
               else
                 Record.mine(current_user).includes(:group).grouped
               end
  end

  def allmyexternalrecords
    @records = if params[:sort] == 'asc' || params[:sort] == 'desc'
                 Record.mine(current_user).not_grouped.order_record(params[:sort]).includes(:group)
               else
                 Record.mine(current_user).not_grouped.includes(:group)
               end
  end

  def show; end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    @record.authorid = @current_user.id
    if @record.save
      flash[:success] = 'Record created successfully'
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @record.update(record_params)
      flash[:success] = 'Record updated successfully'
      render :show
    else
      render :edit
    end
  end

  def destroy
    if @record.destroy
      flash[:success] = 'Record deleted successfully'
      redirect_to dashboard_path
    else
      flash[:danger] = 'Something is wrong, try again later'
      redirect_to record_path(params[:id])
    end
  end

  private

  def set_record
    @record = Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:name, :authorid, :minutes, :group_id)
  end
end
