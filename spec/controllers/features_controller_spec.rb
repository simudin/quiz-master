require 'rails_helper'

RSpec.describe FeaturesController, type: :controller do

  describe "GET #dashboard" do
    it "returns http success" do
      get :dashboard
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #quiz" do
    it "returns http success" do
      get :quiz
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #score" do
    it "returns http success" do
      get :score
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #game_over" do
    it "returns http success" do
      get :game_over
      expect(response).to have_http_status(:success)
    end
  end

end
