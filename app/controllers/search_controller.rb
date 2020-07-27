class SearchController < ApplicationController
    def admin_search
        @range = params[:range]
        search = params[:search]
        @word = params[:word]
        
        if @range == '1'
            @users = ClientUser.search(search,@word)
        else
            @products = Product.search(search,@word)
        end
    end
end
