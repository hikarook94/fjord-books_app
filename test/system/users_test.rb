# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    @alice = users(:alice)
    @bob = users(:bob)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'show users' do
    visit users_url
    assert_selector 'h1', text: 'ユーザ'
  end

  test 'create user' do
    click_on 'ログアウト'
    visit root_url
    click_on 'アカウント登録'

    fill_in 'Eメール', with: 'dave@example.com'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード（確認用）', with: 'password'
    click_button 'アカウント登録'

    assert_text 'アカウント登録が完了しました。'
  end

  test 'update user' do
    visit edit_user_registration_url

    fill_in '氏名', with: 'アリス'
    fill_in '現在のパスワード', with: 'password'
    click_button '更新'

    assert_text 'アカウント情報を変更しました。'
  end

  test 'destroy user' do
    visit edit_user_registration_url
    page.accept_alert do
      click_button 'アカウント削除'
    end
    assert_text 'アカウントを削除しました。またのご利用をお待ちしております。'
  end
end
