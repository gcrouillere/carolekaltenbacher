class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :confirmation, :info, :contact, :cgv, :google906057532e2dbb7e, :robots]

  def home
    @dev_redirection = "https://www.creermonecommerce.fr/"
    render "home_#{@active_theme.name}"
  end

  def confirmation
    render "confirmation_#{@active_theme.name}"
  end

  def info
    @dev_redirection = "https://www.creermonecommerce.fr/#anchor-info"
    render "info_#{@active_theme.name}"
  end

  def contact
    @dev_redirection = "https://www.creermonecommerce.fr/produits"
    render "contact_#{@active_theme.name}"
  end

  def cgv
    @dev_redirection = "https://www.creermonecommerce.fr/product_claim_details"
    render "cgv_#{@active_theme.name}"
  end

  def google906057532e2dbb7e
  end

  def robots
    render 'pages/robots.txt.erb'
    expires_in 6.hours, public: true
  end

end
