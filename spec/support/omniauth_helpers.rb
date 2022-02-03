module OmniAuthHelpers
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google_oauth] = nil
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
                                                                       provider: 'google_oauth2',
                                                                       uid: '123545',
                                                                       info: {
                                                                         name: 'John Doe',
                                                                         email: 'john.doe@example.com',
                                                                         first_name: 'John',
                                                                         last_name: 'Doe',
                                                                         image: 'https://lh3.googleusercontent.com/url/photo.jpg'
                                                                       }
                                                                     })

  def login(user_type = nil)
    if user_type == 'other_user'
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
                                                                           provider: 'google_oauth2',
                                                                           uid: '678910',
                                                                           info: {
                                                                             name: 'pro tarou',
                                                                             email: 'pro.tarou@example.com',
                                                                             first_name: 'pro',
                                                                             last_name: 'tarou',
                                                                             image: 'https://lh3.googleusercontent.com/url/photo.jpg'
                                                                           }
                                                                         })
    end

    visit root_path
    find('.top-authentication__sign-in-btn').click
    sleep 1
  end
end
