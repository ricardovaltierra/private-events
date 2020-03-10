require 'rails_helper'

RSpec.feature "User signs up", type: :feature do

  scenario 'valid username' do
    sign_up_with('TestUser')

    expect(page).to have_content("Welcome TestUser")
  end

  scenario 'invalid username' do
    sign_up_with('a'*51)

    expect(page).to have_content("Log in")
  end

  def sign_up_with(username)
    visit signup_path
    fill_in 'Username', with: username
    click_button 'Sign up'
  end
end
