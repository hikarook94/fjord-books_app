# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @alice = users(:alice)
    @bob = users(:bob)
    @report = reports(:alice_report)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'create report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '6/13の日報'
    fill_in '内容', with: '今日は学習しました。'
    click_on '登録する'

    assert_text '日報が作成されました。'
    click_on '戻る'
  end

  test 'show reports' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '6/13の日報'
    fill_in '内容', with: '表示のテストです'
    click_on '登録する'

    assert_text '6/13の日報'
    assert_text '表示のテストです'
    click_on '戻る'
  end

  test 'update report' do
    visit reports_url
    click_on '詳細'
    click_on '編集'

    fill_in 'タイトル', with: '編集済み6/13の日報'
    fill_in '内容', with: '編集済み今日は学習しました。'
    click_on '更新する'

    assert_text '日報が更新されました。'
    click_on '戻る'
  end
end
