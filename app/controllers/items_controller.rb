class ItemsController < ApplicationController
  respond_to :js
  
  def create
    @list = current_user.list
    @item = Item.new(item_params)
    @item.list = @list
    
    if @item.save
      # flash[:notice] = "Item added successfully!"
    else
      # flash[:error] = "Item was not added successfully. Please try again."
    end
    
    respond_with(@item) do |format|
      format.html { redirect_to list_path(@list) }
    end
  end
  
  def clear
    @list = current_user.list
    @list.items.destroy_all
    
    redirect_to list_path(@list)
  end
  
  def destroy
    @list = current_user.list
    @item = Item.find(params[:id])
    
    if @item.destroy
      # flash[:notice] = "To-Do item completed!"
    else
      # flash[:error] = "There was an error completing this item. Please try again."
    end 
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name)
  end
  
end
