class PagesController < ApplicationController
  # 利用規約の静的ページ表示
  
  include HighVoltage::StaticPage
  skip_before_action :check_logged_in
end