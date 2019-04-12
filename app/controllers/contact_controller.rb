class ContactController < ApplicationController
    def index
    end

    def create
        @name = params[:name]
        @email = params[:email]
        @text = params[:text]
    end
end
