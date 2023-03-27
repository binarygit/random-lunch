class LunchesController < ApplicationController
  SCHEDULING_DATES = Date.new(2023, 04, 01)

  def show
    if params[:id]
      @lunch = Lunch.find(params[:id])
    else
      @lunch = Lunch.upcoming
    end
  end
end
