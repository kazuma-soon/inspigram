class ContactsController < ApplicationController
  skip_before_action :check_logged_in
  def new ;end
end
