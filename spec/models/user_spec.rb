require 'rails_helper'

describe User do
  describe '#create' do
    context '登録できる場合' do
      it 'name、 login_id、 password、password_confirmationがあれば登録できる' do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    context '登録できない場合' do
      it 'nameがなければ登録できない' do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include('を入力してください')
      end

      it 'login_idがなければ登録できない' do
        user = build(:user, login_id: nil)
        user.valid?
        expect(user.errors[:login_id]).to include('を入力してください')
      end

      it 'passwordがなければ登録できない' do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include('を入力してください')
      end

      it 'passwordとpassword_confirmationが違うと登録できない' do
        user = build(:user, password_confirmation: '')
        user.valid?
        expect(
          user.errors[:password_confirmation]
        ).to include('とパスワードの入力が一致しません')
      end
    end
  end
end
