class ListsController < ApplicationController
    def index
      @lists = List.all
    end
  
    def show
      @list = List.find(params[:id])
      @items = @list.items
    end
  
    def new
      @list = List.new
    end
  
    def create
      @list = List.new(list_params)
      if @list.save
        redirect_to @list
      else
        render 'new'
      end
    end
  
    def edit
      @list = List.find(params[:id])
    end
  
    def update
      @list = List.find(params[:id])
      if @list.update(list_params)
        redirect_to @list
      else
        render 'edit'
      end
    end
  
    def destroy
        @list = List.find(params[:id])
        @list.destroy
      
        respond_to do |format|
          format.html { redirect_to lists_path, notice: 'List was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      def delete
        @list = List.find(params[:id])
        @list.delete
        redirect_to lists_path, notice: "Objeto excluído com sucesso."
      end
    
  
    private
  
    def list_params
      params.require(:list).permit(:name)
    end
  end
  
