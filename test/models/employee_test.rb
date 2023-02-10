require "test_helper"

class EmployeeTest < ActiveSupport::TestCase
  def setup
    @employee = Employee.new(email: "ava@ava.com", username: "ava")
  end

  test 'should be valid' do
    assert @employee.valid?
  end

  test 'email should be present' do
    @employee.email = ''
    assert_not @employee.valid?
  end

  test 'username should be present' do
    @employee.username = ''
    assert_not @employee.valid?
  end
  
  test 'email address and username should be unique' do
    duplicate_user = @employee.dup
    @employee.save
    assert_not duplicate_user.valid?
  end
end
