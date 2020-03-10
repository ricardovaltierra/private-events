require 'rails_helper'

RSpec.feature 'Log in', type: :feature do
  scenario 'valid username' do
    log_in

    expect(page).to have_content('Welcome TestUser')
  end

  scenario 'invalid username' do
    visit login_path
    fill_in('Username', with: 'john')
    click_button 'Log in'

    expect(page).to have_content('Log in')
  end

  def log_in
    user = User.create(username: 'TestUser')
    visit login_path
    fill_in 'Username', with: user.username
    click_button 'Log in'
  end
end
