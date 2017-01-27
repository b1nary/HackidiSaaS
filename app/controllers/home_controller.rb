class HomeController < ApplicationController
  def index
    @plans = Plan.where(public: true).limit(3)
  end
end
