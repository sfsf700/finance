require 'rails_helper'

RSpec.describe Genre, type: :model do
  before do
    @genre = FactoryBot.build(:genre)
  end

  describe 'カテゴリーの保存' do
    context 'カテゴリーが保存できるとき' do
      it '全ての項目があればカテゴリーを登録できる' do
        expect(@genre).to be_valid
      end
    end

    context 'カテゴリーが保存できないとき' do
      it 'カテゴリーが空では保存できない' do
        @genre.g_name = ""
        @genre.valid?
        expect(@genre.errors.full_messages).to include("G name can't be blank")
      end

      it 'ユーザーが紐ついていなければ登録できない' do
        @genre.user = nil
        @genre.valid?
        expect(@genre.errors.full_messages).to include("User must exist")
      end
    end

  end
end
