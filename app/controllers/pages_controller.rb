class PagesController < ApplicationController
  def landing
    if user_signed_in?
      redirect_to photos_path
    end
  end

  def about
  end
end
