class StaticPagesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    @contact = StaticPage.new
  end

  def about
    @contact = StaticPage.new
  end

  def create
    @contact = StaticPage.new(static_page_params)
    if @contact.valid?
      StaticPage.update_spreadsheet(@contact)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def static_page_params
    params.require(:static_page).permit(:email)
  end
end
