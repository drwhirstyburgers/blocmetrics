class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = current_user.registered_applications
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new(app_params)
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
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    @registered_application.assign_attributes(app_params)

    if @registered_application.save
      flash[:notice] = "Application was updated."
      redirect_to @registered_application
    else
      flash[:alert] = "There was an error, please try again."
      render :edit
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])

    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.app_name}\" was deleted successfully."
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "There was an error deleting the app."
      render :show
    end
  end


  private

  def app_params
    params.require(:registered_application).permit(:registration, :app_name)
  end
end
