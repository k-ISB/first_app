class RoomsController < ApplicationController
  before_action :logged_in_user, only: [:show]
  
  def show
    @messages = Message.all
  end
end
