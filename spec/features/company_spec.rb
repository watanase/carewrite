require 'rails_helper'

RSpec.feature 'ログインとログアウト' do
  background do
    Company.create!(name: 'abc', password: '00000000')
  end
  scenario 'ログインする' do
    # ログインページを開く
    visit login_company_path
    # ログインフォームにnameとパスワードを入力する
    fill_in 'name', with: 'abc'
    fill_in 'password', with: '00000000'
    # ログインボタンをクリックする
    click_on '企業にログイン'
    # ログインに成功したことを検証する
    expect(page).to have_content '企業からログアウト'
  end

  end
end