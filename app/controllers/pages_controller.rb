class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :testdesk ]

  def home
  end

  def testdesk
  end
end
