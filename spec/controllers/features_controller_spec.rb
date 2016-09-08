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

end
