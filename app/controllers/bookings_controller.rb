class BookingsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :set_car
  before_action :set_user
  before_action :set_booking, only: [:show, :edit, :update, :destroy]




  # GET /bookings
  # GET /bookings.json
  def index
    #puts current_user.id
    if(current_user.user_type == 2)
      @bookings = Booking.where("user_id = ?", current_user.id)
    else
      if(@user == nil and @car == nil)
        @bookings = Booking.all
      elsif(@car == nil)
        @bookings = Booking.where("user_id = ?", @user.id)
      else
        @bookings = Booking.where("car_id = ?", @car.id)
      end

      #@bookings = Booking.all
    end
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @booking.car_id = @car.id
    @booking.user_id = current_user.id
    @pickup = @booking.start_time
    @return = @booking.end_time
    respond_to do |format|
      if @booking.save then
        format.html { redirect_to current_user, notice: 'Booking was successfully created' }
        format.json { render action: 'show', status: :created, location: @booking }
      else
        flash[:notice] = @msg
        format.html { render action: 'new' }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to car_bookings_path(@car), notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def set_car
    if(params[:car_id] != nil)
      @car = Car.find(params[:car_id])
    end
  end

  def set_user
    if(params[:user_id] != nil)
      @user = User.find(params[:user_id])
    end
  end

  def set_booking
    #puts params[:id]
    @booking = Booking.find(params[:id])
  end



  private
  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
