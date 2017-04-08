Given 'a user is not logged in' do
  OmniAuth.config.mock_auth[:google_oauth2] = nil
end

Given 'a user is logged in' do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google_oauth2] = 
    OmniAuth::AuthHash.new ({
      provider: 'google_oauth2',
      info: { email: 'example@example.com' }
    })
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  
  visit '/auth/google_oauth2'
end

When 'they visit the homepage' do
  visit root_url
end

Then 'there should be a link to log in' do
  expect(page).to have_link(I18n.t('layouts.application.log_in'), href: '/auth/google_oauth2/')
end

Then 'there should be a link to log out' do
  expect(page).to have_link(I18n.t('layouts.application.log_out'), href: logout_path)
end

When 'they visit the login link' do
  click_on(I18n.t('layouts.application.log_in'))
end

Then 'they should be logged in' do
  expect(Capybara.current_session.driver.request.session['logged_in']).to be_truthy
end

When 'they visit the logout link' do
  click_on(I18n.t('layouts.application.log_out'))
end

Then 'they should be logged out' do
  expect(Capybara.current_session.driver.request.session['logged_in']).to be_falsey
end