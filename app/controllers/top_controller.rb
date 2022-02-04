class TopController < ApplicationController
  skip_before_action :check_logged_in, only: :index

  def index
    # randomとlimit使うか、
    @boards = Board.find(Board.pluck(:id).shuffle[0..5])
  end
end
