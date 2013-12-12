class PronounsController < ApplicationController
  def index
    @pronouns = Pronoun.all
  end
  def new
    @pronoun = Pronoun.new
  end
  def create
    @pronoun = Pronoun.new(params[:pronoun])
    if @pronoun.save
      redirect_to pronouns_path(@pronoun)
    else
      redirect_to new_pronouns_path
    end
  end
  def show
    @pronoun = Pronoun.find(params[:id])
  end
  def edit
    @pronoun = Pronoun.find(params[:id])
  end
  def update
    @pronoun = Pronoun.find(params[:id])
    if @pronoun.update_attributes(params[:pronoun])
      redirect_to pronouns_path(@pronoun)
    else
      redirect_to edit_pronouns_path
    end
  end
  def destroy
    @pronoun = Pronoun.find(params[:id])
    @pronoun.destroy
  end
end
