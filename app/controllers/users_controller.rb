class UsersController < ApplicationController
  def index
  	@users=User.approved.order(:mark).reverse
  end
end
