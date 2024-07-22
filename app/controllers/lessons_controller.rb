class LessonsController < ApplicationController
  # this code means that box lessons index and lessons show are visible if you are not logged in. Every only page requires a log in.
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # this is the code for PG_search. It references a function writted in the Lesson model page, search_by_category_description_title(params[:query])
    if params[:query].present?
      # if the search matches something, display what it matched
      @lessons = Lesson.search_by_category_description_title(params[:query])
    elsif params[:category].present?
      # if the category bar matches something, display what it matched
      @lessons = Lesson.search_by_category_description_title(params[:category])
    else
      # if no category or query was present, display all
      @lessons = Lesson.all
    end
  end

  def show
    # show the lesson by id
    @lesson = Lesson.find(params[:id])
  end

  def new
    # new lesson
    @lesson = Lesson.new
  end

  def create
    # create a new lesson based on params and assign current user, check strong params below
    @lesson = Lesson.new(lesson_params)
    @lesson.user = current_user
    if @lesson.save!
      # if the current lesson is created succesfully, redirect to the lesson page
      redirect_to lesson_path(@lesson)
    else
    # else render an error
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    # update using strong params
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      # if succesful, redirect to lesson
      redirect_to lesson_path(@lesson)
    else
      # else render an error
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # find the current lesson by id and destroy it, redirect to lessons page
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to lessons_path
  end

  private

  def lesson_params
    # these are strong params or security params, it makes sure only these attributes are changed. Any edits to a model has to be modified here also.
    params.require(:lesson).permit(:category, :description, :title, :price, photos: [])
  end
end
