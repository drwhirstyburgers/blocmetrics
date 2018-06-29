class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = current_user.applications
  end

  def show
    @registered_application = Application.find(params[:id])
  end

  def new
    @registered_application = Application.new
  end

  def create
    @registered_application = Application.new(app_params)
    @registered_application.user = current_user

    if @registered_application.save
      flash[:notice] = "Application was registered."
      redirect_to @registered_application
    else
      flash.now[:alert] = "There was an error registering the application, please try again."
      render :new
    end
  end

  def edit
  end

  private

  def app_params
    params.require(:registered_applications).permit(:registration, :app_name)
  end
end
