class LessonsController < ApplicationController
  layout 'stage'
  skip_before_action :authenticate_user!, only: [:show, :new]

  def show
    @lesson = Lesson.find(params[:id])
    @user = @lesson.user
    @order = Order.where(user: @user, state: "pending", lesson: @lesson).first
  end

  def new
    @dev_redirection = "https://www.creermonecommerce.fr/lessons/new"
    @lesson = Lesson.new
    @input_dates_collection = available_dates_to_input
    @twitter_url = request.original_url.to_query('url')
  end

  def create
    if current_user.lessons.where(confirmed: false).present?
      flash[:alert] = "Vous avez déjà une demande de stage en cours"
      redirect_to new_lesson_path and return
    end

    calendar_update = Calendarupdate.find(params[:lesson][:calendar_update_ref].to_i)
    @lesson = Lesson.create(
      start: calendar_update.period_start,
      duration: (calendar_update.period_end - calendar_update.period_start).round / (24 * 3600) + 1,
      student: params[:lesson][:student].to_i,
      user_id: params[:lesson][:user_id].to_i,
      confirmed: false,
      calendarupdate: calendar_update
      )
    # if @lesson.start < Time.now
    #   @lesson.destroy
    #   flash[:alert] = "Veuillez sélectionner une date dans le futur"
    #   redirect_to new_lesson_path and return
    # end

    if calendar_update.capacity < @lesson.student
      @lesson.destroy
      flash[:alert] = "Impossible de réserver. Plus que #{calendar_update.capacity} place(s) disponible(s) pour ce stage"
      redirect_to new_lesson_path and return
    end
    LessonMailer.mail_francoise_after_lesson_create(@lesson).deliver_now
    redirect_to stage_confirmation_path
  end

  def stage_confirmation
  end

  def stage_payment_confirmation
  end

  private

  def available_dates_to_input
    calendarupdates = Calendarupdate.where(available: true).order(period_start: :asc)
    calendarupdates = calendarupdates.map do |calendarupdate|
      [calendarupdate.name, calendarupdate.id]
    end
    return calendarupdates
  end

end
