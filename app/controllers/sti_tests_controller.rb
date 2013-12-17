class StiTestsController < ApplicationController
  def index
    @sti_tests = StiTest.where(user_id: session[:user_id]).order("date_taken DESC")
    @diseases = Disease.all
  end
  def new
    @sti_test = StiTest.new
    @infection = @sti_test.infections.new
    @diseases = Disease.all
  end
  def create
    @sti_test = StiTest.new(params[:sti_test])
    @sti_test.user_id = session[:user_id]
    if @sti_test.save
      redirect_to sti_test_path(@sti_test)
    else
      redirect_to new_sti_test_path
    end
  end
  def show
    @user = User.find(session[:user_id])
    @sti_test = StiTest.find(params[:id])
    @infections = @sti_test.infections
  end
  def edit
    @sti_test = StiTest.find(params[:id])
    @infections = @sti_test.infections
    @diseases = Disease.all
  end
  def update
    @sti_test = StiTest.find(params[:id])
    if @sti_test.update_attributes(params[:sti_test])
      params[:sti_test][:infections_attributes].each do |key, value|
        if value[:positive] == "_destroy"
          Infection.find(value[:id]).destroy
        end
      end
      redirect_to sti_test_path(@sti_test)
    else
      redirect_to edit_sti_test_path
    end
  end
  def destroy
    @sti_test = StiTest.find(params[:id])
    @sti_test.destroy
  end
end
