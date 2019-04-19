class ContactsController < ApplicationController
    def index
    end
    
    def new
    end

    def create
        @name = params[:name]
        @email = params[:email]
        @body = params[:body]
        redirect_to contacts_path
    end
end

