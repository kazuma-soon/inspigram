module ResizeWindowSupport
  def ensure_browser_size(width = 1280, height = 720)
    Capybara.current_session.driver.browser.manage.window.resize_to(width, height)
  end
end
