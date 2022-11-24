require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'ユーザー新規作成' do
    it 'ユーザーの新規作成ができる' do
      visit 'users/new'

      #labelの存在確認
      expect(page).to have_selector('label', text: User.human_attribute_name(:name)), 'ユーザー名 というラベルが表示されていることを確認してください'
      expect(page).to have_selector('label', text: User.human_attribute_name(:email)), 'メールアドレス というラベルが表示されていることを確認してください'
      expect(page).to have_selector('label', text: User.human_attribute_name(:password)), 'パスワード というラベルが表示されていることを確認してください'
      expect(page).to have_selector('label', text: User.human_attribute_name(:password_confirmation)), 'パスワード確認 というラベルが表示されていることを確認してください'

      # labelとフィールドの対応付け確認
      expect(page).to have_css("label[for='user_name']"), 'name というラベルをクリックすると対応するフィールドにフォーカスすることを確認してください'
      expect(page).to have_css("label[for='user_email']"), 'email というラベルをクリックすると対応するフィールドにフォーカスすることを確認してください'
      expect(page).to have_css("label[for='user_password']"), 'password というラベルをクリックすると対応するフィールドにフォーカスすることを確認してください'
      expect(page).to have_css("label[for='user_password_confirmation']"), 'password_confirmation というラベルをクリックすると対応するフィールドにフォーカスすることを確認してください'

      # ユーザー作成用ボタンの存在確認
      expect(page).to have_button(I18n.t('defaults.register')), 'ユーザー作成用のボタンが表示されていることを確認してください'
    end
  end
end
