class UsersController < ApplicationController
  def home
  end

  def show
    @user = User.find(params[:id])
    if !@user
      redirect_to '/'
    end
    @reservations = Reservation.where(user_id: @user.id).order('id DESC').limit(10)
    @listings = Listing.where(user_id: @user.id).order('id DESC')
  end

  def new
    @errors = {}
    @user = User.new
  end

  def create
    @user = User.new
    @user.email = params[:email]
    @user.name = params[:name]
    @user.username = params[:username]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    @errors = {}
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Signed up successfully"

      redirect_to '/languages'
    else

      @user.errors.messages.each do |key, value|
        if value.any?
          @errors[key] = '*' + value.join(', ')
          flash[:danger] = "Something went wrong. Try again."
        end
      end
      render :new
    end
  end

  def edit
    if session[:user_id] != params[:id].to_i
      redirect_to '/'
    end

    @user = User.find(params[:id])
    @errors = {}
  end

  def update
    if session[:user_id] != params[:id].to_i
      redirect_to '/'
    end

    @user = User.find(session[:user_id])
    @user.email = params[:email]
    @user.name = params[:name]
    @user.username = params[:username]
    if params[:password] != ''
      @user.password_confirmation = params[:password_confirmation]
      @user.password = params[:password]
    end

    @errors = {}
    if @user.save
      flash[:success] = "Your account was updated successfully"
      redirect_to "/users/#{session[:user_id]}"
    else
      flash[:danger] = "Something went wrong. Try again."
      @user.errors.messages.each do |key, value|
        if value.any?
          @errors[key] = '*' + value.join(', ')
        end
      end
      render :edit
    end
  end

  def destroy
    if session[:user_id] != params[:id].to_i
      redirect_to '/'
    end

    user = User.find(params[:id])
    user.destroy
    flash[:warning] = "Your account was deleted successfully"
    redirect_to "/users/#{session[:user_id]}"
  end

end
