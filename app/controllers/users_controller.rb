class UsersController < ApplicationController
  def index
  	@users=User.approved.all
  end
end
