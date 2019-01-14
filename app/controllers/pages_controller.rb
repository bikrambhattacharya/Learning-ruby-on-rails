class PagesController < ApplicationController

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new()
  end

  def create
    @page = Page.new(pages_params)

    if @page.save
      flash[:notice] = "Page created Successfully."
      redirect_to(pages_path)
    else
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(pages_params)
      flash[:notice] = "Page updated successfully."
      redirect_to(page_path(@page))
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page '#{@page.name}' destroyed successfully."
    redirect_to(pages_path)
  end

  private

  def pages_params
    params.require(:page).permit(:name, :position, :visible, :permalink)
  end

end
