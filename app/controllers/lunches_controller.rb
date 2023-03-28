class LunchesController < ApplicationController
  SCHEDULING_MONTHS = [3, 6, 9, 12]

  def show
    if params[:id]
      @lunch = Lunch.find(params[:id])
    else
      @lunch = Lunch.upcoming
    end
  end
end
