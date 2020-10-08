class UsersController < ApplicationController
  def index
    @items = Item.all
  end
  
  def new
    @items = User.new
  end
end
