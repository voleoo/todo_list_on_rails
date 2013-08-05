class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /user
  def index
    @users = User.all
  end

  # GET /user/1
  def show
    respond_to do | format |
      format.json { render json: @projects }
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
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
