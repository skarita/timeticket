class ListingsController < ApplicationController

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @errors = {}
    @listing = Listing.new
  end

  def create
    @listing = Listing.new
    @listing.description = params[:description]
    @listing.name = params[:name]
    @listing.user_id = session[:user_id]
    @listing.image = params[:image]
    @listing.location = params[:location]
    @listing.price = params[:price]
    @listing.length = params[:length]

    @errors = {}
    if @listing.save
      flash[:success] = "Listing added successfully"
      redirect_to "/listings/#{@listing.id}"
    else
      @listing.errors.messages.each do |key, value|
        if value.any?
          @errors[key] = '*' + value.join(', ')
        end
      end
      flash[:danger] = "Something went wrong. Try again."
      render :new
    end
  end

  def edit
    @errors = {}
    @listing = Listing.find(params[:id])

    if session[:user_id] != @listing.user_id && User.find(session[:user_id]).username != "admin"
      redirect_to '/'
    end

  end

  def update
    @listing = Listing.find(params[:id])

    if session[:user_id] != @listing.user_id && User.find(session[:user_id]).username != "admin"
      redirect_to '/'
    end

    @listing.description = params[:description]
    @listing.name = params[:name]
    @listing.user_id = session[:user_id]
    @listing.image = params[:image]
    @listing.location = params[:location]
    @listing.price = params[:price]

    @errors = {}
    if @listing.save
      flash[:success] = "Listing updated successfully"
      redirect_to "/listings/#{@listing.id}"
    else
      @listing.errors.messages.each do |key, value|
        if value.any?
          @errors[key] = '*' + value.join(', ')
        end
      end
      flash[:danger] = "Something went wrong. Try again."
      render :edit
    end
  end

  def destroy
    listing = Listing.find(params[:id])
    if session[:user_id] != listing.user_id
      redirect_to '/'
    end
    listing.destroy
    flash[:success] = "Listing removed successfully"
    redirect_to "/users/#{session[:user_id]}"
  end

  def locations
    @listings = Listing.all
    @reservations = Reservation.all
  end

end
