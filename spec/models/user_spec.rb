require 'rails_helper'

RSpec.describe User, type: :model do

  # ユーザーを作成する
  describe "create user" do

    # 有効なファクトリを持つこと
    it "has a valid factory" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    # 名前がなければ無効な状態であること
    it "is invalid without a name" do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    # メールアドレスがなければ無効な状態であること
    it "is invalid without a email" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    # メールアドレスが無効な形式の場合はエラーとなること
    it "is error if email is an invalid format" do
      user = FactoryBot.build(:user, email: 'test@com')
      expect(user).to be_invalid
    end

    # 重複したメールアドレスなら無効であること
    it "is invalid with a duplicate email address" do
      FactoryBot.create(:user, email: "aaron@example.com")
      user = FactoryBot.build(:user, email: "aaron@example.com")
      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
    end

    # ユーザー名がなければ無効な状態であること
    it "is invalid without a username" do
      user = FactoryBot.build(:user, username: nil)
      user.valid?
      expect(user.errors[:username]).to include("を入力してください")
    end

    # ユーザー名が無効な形式の場合はエラーとなること
    it "is error if email is an invalid format" do
      user = FactoryBot.build(:user, username: 'test_user;;;')
      expect(user).to be_invalid
    end
    
    # 重複したユーザー名なら無効であること
    it "is invalid with a duplicate username" do
      FactoryBot.create(:user, username: "tester")
      user = FactoryBot.build(:user, username: "tester")
      user.valid?
      expect(user.errors[:username]).to include("はすでに存在します")
    end

    # パスワードがなければ無効な状態であること
    it "is invalid without a password" do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

    # パスワードが6文字以下の場合は無効な状態であること
    it "is invalid if password is less than 6 characters" do
      user = FactoryBot.build(:user, password: 'test')
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

    # パスワード確認がなければ無効な状態であること
    it "is invalid without a password_confirmation" do
      user = FactoryBot.build(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end


    # パスワードとパスワード確認が合致していなければ無効な状態であること
    it "is invalid if password and password_confirmation do not match" do
      user = FactoryBot.build(:user, password_confirmation: 'test')
      expect(user).to be_invalid
    end
  end


  #ユーザーのオブジェクトかどうかを調べる
  describe "check if it is a user's object" do

    # 引数がユーザーのオブジェクトだった場合
    context "when argument is a user's object" do
      
      # trueを返す
      it "returns true" do
        theme = FactoryBot.build(:theme)
        expect(theme.user.own?(theme)).to eq true
      end
    end
    
    # 引数がユーザーのオブジェクトではない場合
    context "when argument is not a user's object" do

      # falseを返す
      it "returns false" do
        user = FactoryBot.build(:user, id: 1)
        theme = FactoryBot.build(:theme, user_id: 2)
        expect(user.own?(theme)).to eq false
      end
    end
  end
  
end
