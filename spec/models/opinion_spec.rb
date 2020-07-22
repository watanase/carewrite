require 'rails_helper'

describe Opinion do
  describe '#create' do
    context '登録できる場合' do
      it 'contentがあれば登録できる' do
        opinion = build(:opinion)
        expect(opinion).to be_valid
      end
    end

    context '登録できない場合' do
      it 'contentがなければ登録できない' do
        opinion = build(:opinion, name: nil)
        opinion.valid?
        expect(opinion.errors[:content]).to include('を入力してください')
      end
    end
  end
end
