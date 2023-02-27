require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @record = FactoryBot.create(:record)
  end

  describe '収支の保存' do
    context '収支の保存ができる時' do

      it '全ての項目があればカテゴリーを登録できる' do
        expect(@record).to be_valid
      end

      it '金額が0 ~ 2,000,000,000の間なら保存できる' do
        @record.price = "123456789"
        expect(@record).to be_valid
      end

      it 'メモは空でも登録できる' do
        @record.memo = ''
        expect(@record).to be_valid
      end
    end
      
    context '収支が保存できないとき' do
      it '金額が空では保存できない' do
        @record.price = ""
        @record.valid?
        expect(@record.errors.full_messages).to include("Price can't be blank")
      end

      it '金額が0より小さいと保存できない' do
        @record.price = -1000
        @record.valid?
        expect(@record.errors.full_messages).to include("Price must be greater than or equal to 0")
      end

      it '金額が2,000,000,000より大きいと保存できない' do
        @record.price = '2000000001'
        @record.valid?
        expect(@record.errors.full_messages).to include("Price must be less than or equal to 2000000000")
      end

      it '金額に半角数字以外が含まれていると保存できない' do
        @record.price = '金額200'
        @record.valid?
        expect(@record.errors.full_messages).to include("Price is not a number")
      end

      it '日付が空では保存できない' do
        @record.fdate = ""
        @record.valid?
        expect(@record.errors.full_messages).to include("R date can't be blank")
      end

      it '収支か支出が空では保存できない' do
        @record.status = ""
        @record.valid?
        expect(@record.errors.full_messages).to include("Status can't be blank")
      end

      it '収支か支出のステータスが 1 or 2 以外では保存できない' do
        @record.status = "3"
        @record.valid?
        expect(@record.errors.full_messages).to include("Status must be less than or equal to 2")
      end

      it 'カテゴリーが紐ついていなければ保存できない' do
        @record.genre = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("Genre must exist")
      end

      it 'ユーザーが紐ついていなければ登録できない' do
        @record.user = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("User must exist")
      end

    end

  end
end
