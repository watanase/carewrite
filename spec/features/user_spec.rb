require 'rails_helper'

RSpec.feature 'user/ログインとログアウト' do
  background do
    User.create!(name: 'abe', password: '00000000')
  end
  scenario 'ログインする' do
    # ログインページを開く
    visit login_user_path
    # ログインフォームにnameとパスワードを入力する
    fill_in 'name', with: 'abe'
    fill_in 'password', with: '00000000'
    # ログインボタンをクリックする
    click_on 'ログイン'
    # ログインに成功したことを検証する
    expect(page).to have_content '家族としてログイン中'
    # userへのログインでは'記録を書く'へのリンクが表示されないことを検証する
    expect(page).not_to have_content '記録を書く'
  end
end
