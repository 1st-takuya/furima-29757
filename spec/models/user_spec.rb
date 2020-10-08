require 'rails_helper'

  RSpec.describe User, type: :model do
      before do
        @user = FactoryBot.build(:user)
      end
      describe 'ユーザー新規登録' do
      it "ニックネームが必須(空ではない)であること" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")  
      end
        it "メールアドレスが必須（空ではない）であること" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank") 
      end
      it "メールアドレスが一意性であること" do
        @user.save
        @another_user = FactoryBot.build(:user)
        @another_user.email = @user.email
        @another_user.valid?
        expect(@another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスは@を含む必要があること" do
        @user.email = "aaa@gmail.com"
        expect(@user).to be_valid
      end
      it "パスワードが必須であること" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードは6文字以上であること" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "パスワードは半角英数字混合であること" do
        @user.password = "aaa111"
        @user.password_confirmation = "aaa111"
        @user.valid?
        expect(@user).to be_valid
      end
      it "パスワードは確認用を含めて2回入力すること" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "新規登録・ログイン共にエラーハンドリングができていること（適切では無い値が入力された場合、情報は受け入れられず、エラーメッセージを出力させる）" do
      end
      it "ユーザー本名に名前が必須であること" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid") 
      end
      it "ユーザー本名に名字が必須であること" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid") 
      end
      it "ユーザー本名の名前は全角（漢字・ひらがな・カタカナ）で入力させること" do
        @user.first_name = "山田"
        expect(@user).to be_valid
      end
      it "ユーザー本名の苗字は全角（漢字・ひらがな・カタカナ）で入力させること" do
        @user.last_name = "太郎"
        expect(@user).to be_valid
      end
      it "ユーザー本名の名前にはフリガナが必須であること" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid") 
      end
      it "ユーザー本名の苗字にはフリガナが必須であること" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid") 
      end
      it "ユーザー本名の名前にはフリガナは全角（カタカナ）で入力させること" do
        @user.first_name_kana = "ヤマダ"
        expect(@user).to be_valid
      end
      it "ユーザー本名の苗字にはフリガナは全角（カタカナ）で入力させること" do
        @user.last_name_kana = "タロウ"
        expect(@user).to be_valid
      end
      it "生年月日が必須であること" do
        @user.birth_day = "2020-10-31"
        @user.valid?
        expect(@user).to be_valid
    end
  end
end