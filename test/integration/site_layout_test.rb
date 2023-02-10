require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @employee = employees(:avi)
  end

  test 'layout links' do
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', signup_path

    # nav bar
    #assert_select 'a[href=?]', login_url
    assert_select 'a[href=?]', root_path

    # footer
    # link to my github profile
    assert_select 'a[href=?]', 'https://www.github.com/binarygit'
    # link to the official ruby on rails site
    assert_select 'a[href=?]', 'https://rubyonrails.org/'
  end
end
