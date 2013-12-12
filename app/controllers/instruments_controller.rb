class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
  end
  def new
    @instrument = Instrument.new
  end
  def create
    @instrument = Instrument.new(params[:instrument])
    if @instrument.save
      redirect_to instruments_path(@instrument)
    else
      redirect_to new_instruments_path
    end
  end
  def show
    @instrument = Instrument.find(params[:id])
  end
  def edit
    @instrument = Instrument.find(params[:id])
  end
  def update
    @instrument = Instrument.find(params[:id])
    if @instrument.update_attributes(params[:instrument])
      redirect_to instruments_path(@instrument)
    else
      redirect_to edit_instruments_path
    end
  end
  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy
  end
end
