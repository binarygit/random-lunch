# frozen_string_literal: true

class NavBarComponent < ViewComponent::Base
  def initialize(logged_in)
    @logged_in = logged_in
  end

  private

  def login_or_logout_link
    if @logged_in
      button_to "Logout", logout_path, id: 'logout', class: "paper-btn btn-danger-outline", method: 'delete'
    else
      tag.a "Login", href: login_path, class: "paper-btn btn-secondary-outline"
    end
  end
end
