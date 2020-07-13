require 'rails_helper'

RSpec.feature 'company/ログインとログアウト' do
  background do
    Company.create!(name: 'abc', password: '00000000')
    Recorder.create!(name: 'foo', password: '00000000')
  end
  scenario 'companyにログインして、recorderにログインする' do
    # ログインページを開く
    visit login_company_path
    # ログインフォームにnameとパスワードを入力する
    fill_in 'name', with: 'abc'
    fill_in 'password', with: '00000000'
    # ログインボタンをクリックする
    click_on '企業にログイン'
    # ログインに成功したことを検証する
    expect(page).to have_content '企業からログアウト'

    # ログインページを開く
    visit login_recorder_path
    # ログインフォームにnameとパスワードを入力する
    fill_in 'name', with: 'foo'
    fill_in 'password', with: '00000000'
    # ログインボタンをクリックする
    click_on '記録者としてログイン'
    # ログインに成功したことを検証する
    expect(page).to have_content '記録を終了する'
  end
end
