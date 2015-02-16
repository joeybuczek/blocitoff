class ListsController < ApplicationController
  before_action :authenticate_user! # Users must be signed in for the methods to work
  
  def show
    @list = current_user.list
  end

  def new
    @list = List.new
  end
  
  def create
    @list = List.new(list_params)
    @list.user = current_user
    
    if @list.save
      flash[:notice] = "To-Do List setup successfully!"
      redirect_to list_path(@list)
    else
      flash[:error] = "There was an error saving the To-Do List. Please try again."
      render :new
    end
  end

  def edit
    @list = current_user.list
  end
  
  def update
    @list = current_user.list
    
    if @list.update_attributes(list_params)
      flash[:notice] = "To-Do List updated successfully!"
      redirect_to list_path(@list)
    else
      flash[:error] = "There was an error updating the To-Do List. Please try again."
      render :edit
    end
  end
  
  def destroy
    @list = current_user.list
    
    if @list.destroy
      flash[:notice] = "To-Do List deleted successfully"
      redirect_to root_path
    else
      flash[:error] = "There was an error deleting the To-Do List. Please try again."
      redirect_to list_path(@list)
    end
  end
  
  private
  
  def list_params
    params.require(:list).permit(:title)
  end
  
end
