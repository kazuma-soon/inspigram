module LogoutSupport
  def logout
    click_link('Logout')
    sleep 1
  end
end
