require 'rails_helper'

RSpec.describe User, type: :model do

  # ユーザーを作成する
  describe "create user" do
    before do
      @user = FactoryBot.build(:user)
      @theme = FactoryBot.build(:theme)
    end

    # 有効なファクトリを持つこと
    it "has a valid factory" do
      expect(@user).to be_valid
    end

    # 名前がなければ無効な状態であること
    it "is invalid without a name" do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    # 重複したメールアドレスなら無効であること
    it "is invalid with a duplicate email address" do
      @user.save 
      user = FactoryBot.build(:user)
      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
    end
  end

  #ユーザーのオブジェクトかどうかを調べる
  describe "check if it is a user's object" do
  
    before do
      @theme = FactoryBot.create(:theme)
    end
    
    # 引数がユーザーのオブジェクトだった場合
    context "when argument is a user's object" do
      
      # trueを返す
      it "returns true" do
        expect(@theme.user.own?(@theme)).to eq true
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
