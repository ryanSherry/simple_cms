class SectionsController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in
  before_action :section_count, :only => [:new, :create, :edit, :update]
  before_action :find_page

  def index
    @sections = @page.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:page_id => @page.id)
    @pages = Page.sorted
  end

  def create
    @section = Section.new(section_params)
    @section.page = @page
    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to(sections_path(:page_id => @page.id))
    else
      @pages = Page.sorted
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @pages = Page.sorted
  end

  def update
    @section = Section.find(params[:id])
    if @section.update(section_params)
      flash[:notice] = "Section updated successfully."
      redirect_to(section_path(@section, :page_id => @page.id))
    else
      @pages = Page.sorted
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section destroyed successfully."
    redirect_to(sections_path(:page_id => @page.id))
  end

  private

  def section_params
    params.require(:section).permit(:name, :position, :visible, :content_type, :content)
  end

  def section_count
    @section_count = Section.count
    if params[:action] == 'new' || params[:action] == 'create'
      @section_count += 1
    end
  end

  def find_page
    @page = Page.find(params[:page_id])
  end

end
