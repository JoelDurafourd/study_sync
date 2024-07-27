class UsersController < ApplicationController
  def index
    # references the user in the params, NOT NECESSARILY THE CURRENT USER
    # current user will be referenced by current_user, not @user
    @users = User.all
  end

  def show
    # user profile page, can be any user referenced not just current user, see above comments
    @user = User.find(params[:id])
    @bookings = @user.bookings.order(start_date: :asc)
  end
end
