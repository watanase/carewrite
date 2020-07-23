require 'rails_helper'

RSpec.feature 'user/ログインとログアウト' do
  background do
    Company.create!(id: 1, name: 'hoo', password: '00000000')
    User.create!(
      name: 'fuga',
      login_id: 'abe',
      password: '00000000',
      company_id: 1,
      birthday: '1900-01-01',
      occupancy: '1900-01-01'
    )
  end
  scenario 'ログインする' do
    # ログインページを開く
    visit login_user_path
    # ログインフォームにnameとパスワードを入力する
    fill_in 'login_id', with: 'abe'
    fill_in 'password', with: '00000000'
    # ログインボタンをクリックする
    click_on 'ログイン'
    # ログインに成功したことを検証する
    expect(page).to have_content 'ご意見箱'
    # userへのログインでは'記録を書く'へのリンクが表示されないことを検証する
    expect(page).not_to have_content '記録を書く'
  end
end
