class UsersController < ApplicationController

  # GET /user
  def index
  end

  # GET /user/1
  def show
    respond_to do | format |
      format.json { render json: current_user }
    end
  end

  # GET /user/new
  def new
    @user = User.new
  end

  # GET /user/1/edit
  def edit
  end

  # POST /user
  def create
    @user = User.find_by_email(user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      render json: current_user
    else
      render json: @user
    end
  end

  # POST /users
  def registration
    @user = User.new(user_params)
    if @user.save
      respond_to do | format |
        format.json { render json: @user }
      end
    else
      respond_to do | format |
        format.json { render json: @user }
      end
    end
  end

  # PATCH/PUT /user/1
  def update
  end

  # DELETE /users/1
  def destroy
    session[:user_id] = nil
    respond_to do | format |
      format.json { render json: '' }
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
