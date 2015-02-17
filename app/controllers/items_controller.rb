class ItemsController < ApplicationController
  
  def create
    @list = current_user.list
    @item = Item.new(item_params)
    @item.list = @list
    
    if @item.save
      flash[:notice] = "Item added successfully!"
      go_back_to_list
    else
      flash[:error] = "Item was not added successfully. Please try again."
      go_back_to_list
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name)
  end
  
  def go_back_to_list
    redirect_to list_path(@list)
  end
  
end
