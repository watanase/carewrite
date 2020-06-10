# require 'rails_helper'

# RSpec.feature 'recorder/ログインとログアウト' do
#   background do
#     Recorder.create!(name: 'foo', password: '00000000')
#   end
#   scenario 'ログインする' do
#     # ログインページを開く
#     visit login_recorder_path
#     # ログインフォームにnameとパスワードを入力する
#     fill_in 'name', with: 'foo'
#     fill_in 'password', with: '00000000'
#     # ログインボタンをクリックする
#     click_on '記録者としてログイン'
#     # ログインに成功したことを検証する
#     expect(page).to have_content '記録を終了する'


#   end

# end