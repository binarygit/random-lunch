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
end
