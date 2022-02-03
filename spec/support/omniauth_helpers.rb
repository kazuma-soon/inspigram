module OmniAuthHelpers
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google_oauth] = nil
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    :provider => 'google_oauth2',
    :uid => '123545',
    :info => {
      :name => "John Doe",
      :email => "john.doe@example.com",
      :first_name => "John",
      :last_name => "Doe",
      :image => "https://lh3.googleusercontent.com/url/photo.jpg"
    }
  })
end