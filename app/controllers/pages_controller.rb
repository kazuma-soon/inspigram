class PagesController < ApplicationController
  include HighVoltage::StaticPage
  skip_before_action :check_logged_in
end
