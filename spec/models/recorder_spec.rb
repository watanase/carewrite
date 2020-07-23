require 'rails_helper'

describe Recorder do
  describe '#create' do
    context '登録できる場合' do
      it 'name、login_id、password、password_confirmationがあれば登録できる' do
        recorder = build(:recorder)
        expect(recorder).to be_valid
      end
    end

    context '登録できない場合' do
      it 'nameがなければ登録できない' do
        recorder = build(:recorder, name: nil)
        recorder.valid?
        expect(recorder.errors[:name]).to include('を入力してください')
      end

      it 'login_idがなければ登録できない' do
        recorder = build(:recorder, login_id: nil)
        recorder.valid?
        expect(recorder.errors[:login_id]).to include('を入力してください')
      end

      it 'passwordがなければ登録できない' do
        recorder = build(:recorder, password: nil)
        recorder.valid?
        expect(recorder.errors[:password]).to include('を入力してください')
      end

      it 'passwordとpassword_confirmationが違うと登録できない' do
        recorder = build(:recorder, password_confirmation: '')
        recorder.valid?
        expect(
          recorder.errors[:password_confirmation]
        ).to include('とパスワードの入力が一致しません')
      end
    end
  end
end
