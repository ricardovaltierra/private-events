require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'GET /login' do
    it 'should show the login page' do
      get login_path
      expect(response).to be_successful
      expect(response).to render_template('sessions/new')
    end
  end

  describe 'GET /signup' do
    it 'should show the signup page' do
      get signup_path
      expect(response).to be_successful
      expect(response).to render_template('users/new')
    end
  end
end
