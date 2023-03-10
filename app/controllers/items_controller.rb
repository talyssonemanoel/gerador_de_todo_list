class ItemsController < ApplicationController
    def create
      @list = List.find(params[:list_id])
      @item = @list.items.create(item_params)
      redirect_to list_path(@list)
    end
  
    def update
      @list = List.find(params[:list_id])
      @item = @list.items.find(params[:id])
      if @item.update(item_params)
        redirect_to list_path(@list)
      else
        render 'lists/show'
      end
    end
  
    def destroy
      @list = List.find(params[:list_id])
      @item = @list.items.find(params[:id])
      @item.destroy
      redirect_to list_path(@list)
    end
  
    private
  
    def item_params
      params.require(:item).permit(:description, :completed)
    end
  end
  