require 'rails_helper'

RSpec.feature 'company/ログインとログアウト' do
  background do
    Company.create!(name: 'hoo', password: '00000000')
    Recorder.create!(name: 'abe', login_id: 'huga', password: '00000000')
    user = User.create!(
            name: 'fuga',
            login_id: 'abe',
            password: '00000000',
            company_id: 1,
            birthday: '1900-01-01',
            occupancy: '1900-01-01'
          )
  end
  scenario 'companyにログインして、recorderにログインする' do
    # ログインページを開く
    visit login_company_path
    # ログインフォームにnameとパスワードを入力する
    fill_in 'name', with: 'hoo'
    fill_in 'password', with: '00000000'
    # ログインボタンをクリックする
    click_on '企業にログイン'
    # ログインに成功したことを検証する
    expect(page).to have_content '企業からログアウト'

    # ログインページを開く
    visit login_recorder_path
    # ログインフォームにnameとパスワードを入力する
    fill_in 'login_id', with: 'huga'
    fill_in 'password', with: '00000000'
    # ログインボタンをクリックする
    click_on '記録者としてログインする'
    # ログインに成功したことを検証する
    expect(page).to have_content '記録を終了する'

    # ユーザーページを開いて記録を書く
    visit user_path(user)
    visit new_user_post_path(user)

    fill_in 'login_id', with: '1900-01-01'
    fill_in 'focus', with: 'foo'
    fill_in 'content', with: 'fuzz'

    click_on '登録する'

    expect(page).to have_content '編集'
  end
end
