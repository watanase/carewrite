require 'rails_helper'

describe Post do
  describe '#create' do
    context '登録できる場合' do
      it 'focus、contentがあれば登録できる' do
        post = build(:post)
        expect(post).to be_valid
      end
    end

    context '登録できない場合' do
      it 'focusがなければ登録できない' do
        post = build(:post, focus: nil)
        post.valid?
        expect(post.errors[:focus]).to include('を入力してください')
      end

      it 'contentがなければ登録できない' do
        post = build(:post, content: nil)
        post.valid?
        expect(post.errors[:content]).to include('を入力してください')
      end
    end
  end
end
