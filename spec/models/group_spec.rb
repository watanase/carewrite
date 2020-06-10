require 'rails_helper'

describe Group do
  describe '#create' do
    context '登録できる場合' do
      it 'nameがあれば登録できる' do
        group = build(:group)
        expect(group).to be_valid
      end

    end

    context '登録できない場合' do
      it 'nameがなければ登録できない' do
        group = build(:group, name: nil)
        group.valid?
        expect(group.errors[:name]).to include('を入力してください')
      end

    end
  end
end
