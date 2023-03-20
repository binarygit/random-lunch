class LunchesController < ApplicationController
  def show
    if params[:id]
      @lunch = Lunch.find(params[:id])
    else
      @lunch = Lunch.upcoming
    end
  end
end
