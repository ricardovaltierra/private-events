require 'rails_helper'

RSpec.feature 'Events', type: :feature do
  scenario 'logged in user' do
    log_in
    expect(page).to have_content('Welcome TestUser')
    click_link('Create event')
    find_fields
  end

  scenario 'valid field' do
    log_in
    expect(page).to have_content('Welcome TestUser')
    click_link('Create event')
    find_fields
    fill_fields
    click_button 'Create Event'
    expect(page).to have_content('Microverse')
  end

  scenario 'invalid fields' do
    log_in
    expect(page).to have_content('Welcome TestUser')
    click_link('Create event')
    find_fields
    click_button 'Create Event'
    find_fields
    expect(page).to_not have_content('Microverse')
  end

  def log_in
    user = User.create(username: 'TestUser')
    visit login_path
    fill_in 'Username', with: user.username
    click_button 'Log in'
  end

  def find_fields
    find_field('Name')
    find_field('Location')
    find_field('Date')
    find_field('Content')
  end

  def fill_fields
    fill_in 'Name', with: 'Microverse Event'
    fill_in 'Location', with: 'Mexico'
    fill_in 'Date', with: Time.now
    fill_in 'Content', with: 'Welcome to the event'
  end
end
