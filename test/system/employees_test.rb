require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase
  def setup
    @avi = employees(:avi)
  end

  test 'new employee signs up' do
    visit signup_url
    fill_in "Username", with: "Bobby"
    fill_in "Email", with: "bobby@bobby.com"
    fill_in "Password", with: "foobarfoobar"
    fill_in "Password confirmation", with: "foobarfoobar"
    click_on "Create Account"
    assert_text "Please check your email to confirm your account."
  end

  test 'employee logs in' do
    login_as(@avi)
    assert_text "Welcome #{@avi.username}"
  end

  #test 'employee logs out' do
  #  login_as(@avi)
  #  # TODO capybara cannot find the logout btn
  #  find(:xpath, '//*[@id="logout"]').click
  #  assert_text "Sucessfully logged out!"
  #end

  private

  def login_as(employee)
    visit login_url
    fill_in "Email", with: employee.email
    fill_in "Password", with: "foobarfoobar"
    click_button "Login"
  end
end
