require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @employee = employees(:avi)
  end

  test 'layout links before login' do
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', signup_path

    # nav bar
    assert_select 'a[href=?]', login_path
    assert_select 'a[href=?]', root_path

    # footer
    # link to my github profile
    assert_select 'a[href=?]', 'https://www.github.com/binarygit'
    # link to the official ruby on rails site
    assert_select 'a[href=?]', 'https://rubyonrails.org/'
  end

  test 'layout links after login' do
    post login_path, params: {
      email: 'avi@avi.com',
      password: 'foobarfoobar'
    } 
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', signup_path

    # nav bar
    assert_select 'button[type=?]', 'submit', text: 'Logout'
    assert_select 'a[href=?]', root_path

    # footer
    # link to my github profile
    assert_select 'a[href=?]', 'https://www.github.com/binarygit'
    # link to the official ruby on rails site
    assert_select 'a[href=?]', 'https://rubyonrails.org/'

    # test layout in upcoming lunch page
    get upcoming_lunch_path
    assert_select '#no-upcoming-lunch'
    assert_select '#meme-container'
    assert_select '#countdown-timer'
  end
end
