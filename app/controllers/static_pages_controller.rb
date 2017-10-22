class StaticPagesController < ApplicationController
  before_action :form_data, only: :home

  def home
  end

  def about
  end

  def contact
  end
end
