class SectionsController < ApplicationController


  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new()
  end

  def create
    @section = Section.new(sections_params)

    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to(sections_path)
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])

    if @section.update_attributes(sections_params)
      flash[:notice] = "Section updated successfully."
      redirect_to(section_path(@section))
    else
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section '#{@section.name}' deleted sucessfully."
    redirect_to(sections_path)
  end

  private
  def sections_params
    params.require(:section).permit(:name, :position, :visible, :content_type, :content)
  end

end
