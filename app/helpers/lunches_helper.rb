module LunchesHelper
  def unix_timestamp_of(date)
    # I need to multiply the timestamp by 1000
    # because it looks like javascipt's version of the
    # unix timestamp is different.'
    # For JS a minute after the unix epoch is 
    # new Date(6000)
    # instead of
    # new Date(60)
    date.beginning_of_day.to_i * 1000
  end

  def random_meme_filename
    "memes/meme-#{rand(0..11)}"
  end

  def get_next_scheduling_date
    Date.new(Date.today.year, next_scheduling_month)
  end

  private

  def next_scheduling_month
    LunchesController::SCHEDULING_MONTHS.select {|month| Date.today.month < month}.first
  end
end
