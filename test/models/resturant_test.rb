require "test_helper"

class ResturantTest < ActiveSupport::TestCase
  def setup
    @restro = Resturant.new(name: "Jheer Sekuwa", misc_info: "Great Place for sekuwa. Alcohol on MRP.")
  end

  test 'should be valid' do
    assert @restro.valid?
  end

  test 'name cannot be blank' do
    @restro.name = ''
    assert_not @restro.valid?
  end

  test 'name should be unique' do
    another_restro = @restro.dup
    @restro.save
    assert_not another_restro.valid?
  end
end
