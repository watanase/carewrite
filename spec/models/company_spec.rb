require 'rails_helper'

describe Company do
  describe '#create' do
    context '登録できる場合' do
      it 'name、password、password_confirmationがあれば登録できる' do
        company = build(:company)
        expect(company).to be_valid
      end
    end

    context '登録できない場合' do
      it 'nameがなければ登録できない' do
        company = build(:company, name: nil)
        company.valid?
        expect(company.errors[:name]).to include('を入力してください')
      end

      it 'passwordがなければ登録できない' do
        company = build(:company, password: nil)
        company.valid?
        expect(company.errors[:password]).to include('を入力してください')
      end

      it 'passwordとpassword_confirmationが違うと登録できない' do
        company = build(:company, password_confirmation: '')
        company.valid?
        expect(
          company.errors[:password_confirmation]
        ).to include('とパスワードの入力が一致しません')
      end
    end
  end
end
