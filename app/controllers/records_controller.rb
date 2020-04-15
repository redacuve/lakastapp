class RecordsController < ApplicationController
  before_action :logged_in_user
  before_action :set_record, only: %i[show edit update destroy]

  def index
    @records = case params[:sort]
               when 'asc'
                 Record.all.recents
               when 'desc'
                 Record.all.ancients
               else
                 Record.all.recents
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
      redirect_to records_path
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
    @record.destroy
    flash[:success] = 'Record deleted successfully'
    redirect_to records_path
  end

  private

  def set_record
    @record = Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:name, :authorid, :minutes, :group_id)
  end
end
