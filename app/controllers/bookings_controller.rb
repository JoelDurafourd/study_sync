class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new(lesson: @lesson, user: current_user)
    @lesson = Lesson.find(params[:lesson_id])
    @booking.user = current_user
  end

  def create
    @booking = Booking.new(booking_params.merge(lesson: @lesson, user: current_user))
    @lesson = Lesson.find(params[:lesson_id])
    @booking.lesson_id = @lesson.id
    @booking.user = current_user
    if @booking.save
      redirect_to lesson_path(@lesson), notice: 'Booking successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to lesson_path(@booking.lesson), status: :see_other
  end

  def accept
    @booking = Booking.find(params[:booking_id])
    if @booking.update(status: :accepted)
      redirect_to booking_path(@booking)
    end
  end

  def decline
    @booking = Booking.find(params[:booking_id])
    if @booking.update(status: :declined)
      redirect_to booking_path(@booking)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
