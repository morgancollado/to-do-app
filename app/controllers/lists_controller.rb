class ListsController < ApplicationController
    def new 
        @list = List.new
    end 

    def create 
        @list = List.new(list_params)
        if @list.save
            redirect_to list_path(@list)
        else 
            render :new 
        end 
    end 

    def edit
        @list = List.find(params[:id])
    end 

    def update 
        if @list = List.update(list_params)
            redirect_to list_path(@list)
        else 
            render :edit
        end 
    end 

    def delete
        @list = List.find(params[:id])
        @list.destroy
        redirect_to lists_path 

    end 

    def index 
        @lists = List.all
    end 

    def show 
        @list = List.find(params[:id])
    end 

    def list_params
        params.require(:list).permit(:title)
    end 
end
