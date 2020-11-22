require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:user) { create(:user) }
  let!(:another_user) { create(:user) }
  let!(:admin) { create(:user, :admin) }

  describe "#index" do
    context "管理者ユーザーの場合" do
      it "正常にアクセスできること" do
        sign_in admin
        get users_path
        expect(response).to have_http_status 200
      end
    end

    context "未ログイン状態の場合" do
      it "ログインページにリダイレクトされること" do
        get edit_user_registration_path
        expect(response).to have_http_status 302
        expect(response).to redirect_to "/users/sign_in"
      end
    end

    context "管理者でない場合" do
      it "投稿一覧ページにリダイレクトされること" do
        sign_in another_user
        get users_path
        expect(response).to have_http_status 302
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "#destroy" do
    context "管理者の場合" do
      it "ユーザーを正常に削除できること" do
        sign_in admin
        expect { delete user_path(user) }.to change { User.count }.by(-1)
        expect(response).to redirect_to users_path
      end
    end

    context "未ログイン状態の場合" do
      it "ログインページにリダイレクトされること" do
        delete user_path(user)
        expect(response).to have_http_status 302
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end
end
