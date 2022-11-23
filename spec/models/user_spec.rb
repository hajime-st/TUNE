require 'rails_helper'

RSpec.describe User, type: :model do

  # ユーザーを作成する
  describe "create user" do
    before do
      @user = User.create(
        name: "Tester",
        email: "tester@example.com",
        password: "dottle-nouveau-pavilion-tights-furze",
        password_confirmation: "dottle-nouveau-pavilion-tights-furze"
      )

      @theme = Theme.create(
        title: "test",
      )
    end

    # 名前、メール、パスワードがあれば有効な状態であること
    it "is valid with a name, email, and password" do
      expect(@user).to be_valid
    end

    # 名前がなければ無効な状態であること
    it "is invalid without a name" do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    # 重複したメールアドレスなら無効であること
    it "is invalid with a duplicate email address" do
      user = User.new(
        name: "Tester2",
        email: "tester@example.com",
        password: "dottle-nouveau-pavilion-tights-furze",
        password_confirmation: "dottle-nouveau-pavilion-tights-furze"
      )

      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
    end
  end

  #ユーザーのオブジェクトかどうかを調べる
  describe "check if it is a user's object" do
  
    before do
      @user = User.create(
        name: "Tester",
        email: "tester@example.com",
        password: "dottle-nouveau-pavilion-tights-furze",
        password_confirmation: "dottle-nouveau-pavilion-tights-furze"
      )

      @theme = Theme.create(
        title: "test theme",
        user_id: @user.id
      )
    end

    # 引数がユーザーのオブジェクトだった場合
    context "when argument is a user's object" do
  
      # trueを返す
      it "returns true" do
        expect(@user.own?(@theme)).to eq true
      end
    end
    
    # 引数がユーザーのオブジェクトではない場合
    context "when argument is not a user's object" do

      # falseを返す
      it "returns false" do
        user = User.new(
          id: 1,
          name: "Tester",
          email: "tester@example.com",
          password: "dottle-nouveau-pavilion-tights-furze",
          password_confirmation: "dottle-nouveau-pavilion-tights-furze"
        )
        theme = Theme.new(
          title: "test theme",
          user_id: 2
        )
        expect(user.own?(theme)).to eq false
      end
    end
  end
  
end