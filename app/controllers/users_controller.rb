class UsersController < ApplicationController
  def index
    # render text: "I'm in the index action!"
    @users = User.all
    render json: @users
  end

  def create
    user = User.new(params[:user].permit(:name, :email))
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    User.find(params[:id]).update!(user_params)
  end

  def destroy
    User.find(params[:id]).destroy
  end
  
  private

  def user_params
    params.require(:id).permit(:name, :age)
  end



end
