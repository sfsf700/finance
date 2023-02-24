require 'rails_helper'

describe RecordsController, type: :request do
  
  before do
    @record = FactoryBot.create(:record)
  end

  describe 'GET #new' do
    it 'newアクションにリクエストすると正常にレスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end
  end
end
