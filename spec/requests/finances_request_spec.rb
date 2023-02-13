require 'rails_helper'

RSpec.describe "Finances", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/finances/new"
      expect(response).to have_http_status(:success)
    end
  end

end
