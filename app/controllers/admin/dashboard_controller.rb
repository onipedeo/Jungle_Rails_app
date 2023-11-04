class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: 'jungle', password: 'book' do |username, password|
  username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
end


  def show
  end
end
