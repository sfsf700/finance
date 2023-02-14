require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '登録できない場合' do
        it 'nameが空では登録できない' do
          @user.name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Name can't be blank")
        end

        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'emailが重複している場合は登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

         it 'emailは@を含まないと登録できない' do
          @user.email = 'mocha'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
         end

         it 'passwordが5文字以下だと登録できない' do
          @user.password = '90928'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
         end

        it 'passwordが半角数字のみだと登録できない' do
          @user.password = '20230214'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'passwordが半角英字のみだと登録できない' do
          @user.password = 'mochamocha'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
        end

        it 'passwordは全角を含んではいけない' do
          @user.password = '９２８928mocha'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
        end

        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = '2023mocha'
          @user.password_confirmation = 'mocha928'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
    end

  end
end
