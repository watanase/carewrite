require 'rails_helper'

describe Family do
  describe '#create' do
    context '登録できる場合' do
      it 'nameがあれば登録できる' do
        group = build(:family)
        expect(family).to be_valid
      end
    end

    context '登録できない場合' do
      it 'nameがなければ登録できない' do
        family = build(:family, name: nil)
        family.valid?
        expect(family.errors[:name]).to include('を入力してください')
      end
    end
  end
end
