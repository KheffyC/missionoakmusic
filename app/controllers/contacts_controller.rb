class ContactsController < ApplicationController
  before_action :set_boosters

  def index; end

  def show; end

  def create
    flash[:alert] = 'Contact form is no longer available.'
    redirect_to home_index_path
  end

  private

  def set_boosters
    @boosters = Booster.all
  end
end
