# frozen_string_literal: true

class NavBarComponent < ViewComponent::Base
  def initialize(logged_in)
    @logged_in = logged_in
  end

  private

  def login_or_logout_link
    if @logged_in
      tag.a "Logout", href: logout_path, class: "paper-btn btn-danger-outline"
    else
      tag.a "Login", href: login_path, class: "paper-btn btn-secondary-outline"
    end
  end
end
