class ReportsController < ApplicationController
  def report1
    @seeds = Seed.includes(:fruit).by_app_id 1
  end

  def report2
    @seeds = Seed.includes(:fruit).by_app_id 2
  end
end
