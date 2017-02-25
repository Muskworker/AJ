require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #create' do
    it 'returns http redirect' do
      get :create
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'GET #delete' do
    it 'returns http redirect' do
      get :delete
      expect(response).to have_http_status(:redirect)
    end
  end
end
