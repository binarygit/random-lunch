require "test_helper"

class LunchTest < ActiveSupport::TestCase
  def setup
    @lunch = Lunch.new(resturant: resturants(:gurkha), lunch_date: Date.yesterday)
  end

  test "should be valid" do
    assert @lunch.valid?
  end

  test "lunch date is required" do
    @lunch.lunch_date = nil
    assert_not @lunch.valid?
  end

  test "resturant is required" do
    @lunch.resturant = nil
    assert_not @lunch.valid?
  end

  test "upcoming scope returns the upcoming lunch" do
    @lunch.save
    assert_equal 2, Lunch.count
    upcoming_lunch = Lunch.upcoming
    assert_equal lunches(:upcoming_lunch), upcoming_lunch
  end

  test "today? returns whether the lunch is today" do
    assert_not @lunch.today?
    @lunch.lunch_date = Date.today
    assert @lunch.today?
  end
end
