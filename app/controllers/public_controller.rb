class PublicController < ApplicationController

  layout 'public'

  before_action :setup_navigation

  def index
  end

  def show
    @page = Page.visible.where(:permalink => params[:permalink]).first
    @page.nil? ? redirect_to(root_path) : render()
  end

  private

  def setup_navigation
    @Subject = Subject.visible.sorted
  end
end
