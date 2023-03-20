require "test_helper"

class LunchTest < ActiveSupport::TestCase
  def setup
    @lunch = Lunch.new(resturant: resturants(:gurkha), lunch_date: Date.today)
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
end
