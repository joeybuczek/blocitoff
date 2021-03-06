class ListsController < ApplicationController
  before_action :authenticate_user! # Users must be signed in for the methods to work
  
  def show
    @list = current_user.list
    @items = current_user.list.items
  end

  def new
    create
  end
  
  def create
    @list = List.new(user: current_user, title: "My To-Do List")
    @list.save
    go_back_to_list
  end

  def edit
    @list = current_user.list
  end
  
  def update
    @list = current_user.list
    
    if @list.update_attributes(list_params)
      flash[:notice] = "To-Do List updated successfully!"
      go_back_to_list
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
      go_back_to_list
    end
  end
  
  private
  
  def list_params
    params.require(:list).permit(:title)
  end
  
  def go_back_to_list
    redirect_to list_path(@list)
  end
  
end
