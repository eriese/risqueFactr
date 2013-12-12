class PrefsController < ApplicationController
  def index
    @prefs = Pref.all
  end
  def new
    @pref = Pref.new
  end
  def create
    @pref = Pref.new(params[:pref])
    if @pref.save
      redirect_to prefs_path(@pref)
    else
      redirect_to new_prefs_path
    end
  end
  def show
    @pref = Pref.find(params[:id])
  end
  def edit
    @pref = Pref.find(params[:id])
  end
  def update
    @pref = Pref.find(params[:id])
    if @pref.update_attributes(params[:pref])
      redirect_to prefs_path(@pref)
    else
      redirect_to edit_prefs_path
    end
  end
  def destroy
    @pref = Pref.find(params[:id])
    @pref.destroy
  end
end
