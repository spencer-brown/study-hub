class PagesController < ApplicationController
  before_filter :authenticate_user!, except: :home

  def home
  end

  def dashboard
  end

  def howto
  end

  def getting_started
  end
end
