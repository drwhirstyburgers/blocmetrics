class WelcomeController < ApplicationController
  def index
    @sample_app = RegisteredApplication.all.sample
    @events = @sample_app.events.group_by(&:event_name)
  end

  def about
  end
end
