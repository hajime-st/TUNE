require 'rails_helper'

RSpec.describe Theme, type: :model do

  # お題を作成する
  describe "create theme" do

    # 有効なファクトリを持つこと
    it "has a valid factory" do
      theme = FactoryBot.build(:theme)
      expect(theme).to be_valid
    end

    # タイトルが50文字の場合ははエラーとならない
    it "isn't error if title is 50 characters" do
      theme = FactoryBot.build(:theme, title: Faker::Lorem.characters(number: 50))
      expect(theme).to be_valid
    end

    # タイトルが51文字以上の場合はエラーとなる
    it "occurs error if title is more than 51 characters" do
      theme = FactoryBot.build(:theme, title: Faker::Lorem.characters(number: 51))
      theme.valid?
      expect(theme.errors[:title]).to include("は50文字以内で入力してください")
    end
    
    # 詳細が160文字の場合ははエラーとならない
    it "isn't error if description is 160 characters" do
      theme = FactoryBot.build(:theme, description: Faker::Lorem.characters(number: 160))
      expect(theme).to be_valid
    end
    
    # 詳細が160文字以上の場合はエラーとなる
    it "occurs error if description is more than 160 characters" do
      theme = FactoryBot.build(:theme, description: Faker::Lorem.characters(number: 161))
      theme.valid?
      expect(theme.errors[:description]).to include("は160文字以内で入力してください")
    end

  end

end
