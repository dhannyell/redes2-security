class InjectionController < ApplicationController
    def index
      @contacts = Contact.find(1)
      
      puts(Contact.last())
      render 'index'
    end


    def create
        @phones = Contact.where("id = '#{params[:q]}'")
        render 'index'
    end
  end
  