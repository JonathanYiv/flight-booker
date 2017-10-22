class StaticPagesController < ApplicationController
  before_action :new_flight, only: :home

  def home
  end

  def about
  end

  def contact
  end
end
