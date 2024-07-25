class BookingsController < ApplicationController
  def index
    # This displays all bookings regardless of which user or lesson it's attached to.
    @bookings = Booking.all
  end

  def show
    # this shows a singular lesson, usually the lesson attached to the page or whatever link you're clicking on.
    @booking = Booking.find(params[:id])
  end

  def new
    # creates a new booking
    @booking = Booking.new(lesson: @lesson, user: current_user)
    # assigns current lesson to the new booking
    @lesson = Lesson.find(params[:lesson_id])
    # assigns current user to the booking
    @booking.user = current_user
  end

  def create
    # creates a new booking based on provided inputs, it uses private security params below.
    @booking = Booking.new(booking_params.merge(lesson: @lesson, user: current_user))
    # assigns current lesson to the new booking
    @lesson = Lesson.find(params[:lesson_id])
    @booking.lesson_id = @lesson.id
    # assigns current user to the booking
    @booking.user = current_user
    if @booking.save
      # if the current booking is created succesfully, redirect to the lesson it was booked from
      redirect_to user_path(current_user), notice: 'Booking successfully created!'
    else
      # else display an error message
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # find the booking to edit
    @booking = Booking.find(params[:id])
  end

  def update
    # update using security params below
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      # if the current booking is saved succesfully, redirect to the booking page
      redirect_to booking_path(@booking)
    else
      # else display an error message
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # find booking, delete it, then redired to its original lesson it came from.
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to lesson_path(@booking.lesson), status: :see_other
  end

  def accept
    # change the bookings status to accepted, redirect to the booking path
    @booking = Booking.find(params[:booking_id])
    if @booking.update(status: :accepted)
      redirect_to user_path(@booking.lesson.user)
    end
  end

  def decline
    # change the bookings status to declined, redirect to the booking path
    @booking = Booking.find(params[:booking_id])
    if @booking.update(status: :declined)
      redirect_to user_path(@booking.lesson.user)
    end
  end

  private

  def booking_params
    # these are strong params or security params, it makes sure only these attributes are changed. Any edits to a model has to be modified here also.
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
