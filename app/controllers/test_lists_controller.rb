class TestListsController < ApplicationController

  load_and_authorize_resource param_method: :test_list_params

  def index
    @test_lists = TestList.includes(:owner)
  end

  #def show
  #end

  def new
    @test_list = TestList.new
  end

  def edit
  end

  def create
    @test_list = current_user.test_lists.new(test_list_params)
    if @test_list.save
      redirect_to test_lists_path
    else
      render :new
    end
  end

  def update
    if @test_list.update(test_list_params)
      redirect_to test_lists_path
    else
      render :edit
    end
  end

  def destroy
    @test_list.destroy
    redirect_to test_lists_path
  end

  private
    def test_list_params
      params.require(:test_list).permit(:name)
    end
end