class Public::SampleIllustrationsController < ApplicationController
  ## enjoy_controller_public_sample_illustrations_show用

  ## 管理者_顧客_投稿_詳細画面 sample_illustration_path
  def show
    ## 投稿した sample_illustoration :id を取得するレコード
    @sample_illustration = SampleIllustration.find(params[:id])
  end

  ##
  def create
    ## star 格納
    @sample_illustration = SampleIllustration.new(sample_illustration_params)

    ## reviewを呼び出す記述
    @sample_illustration.customer = current_customer

    ## 記録保存が成功すれば投稿詳細へ
    if @sample_illustration.save

      ## 遷移先 サンプル投稿_詳細画面
      redirect_to illustration_reviews_path(@review.id), notice: "You have created book successfully."

    else ## 保存できなかった場合, :画像投稿フォーム再表示
      @sample_illustration = SampleIllustration.all

      render :show

    end
  end

  ## イラスト_投稿_情報更新する /illustration/:id
  def update
    # #アクセス制限
    ## is_matching_login_user

    ## インスタンス変数 = 商品_find 探す:単数でどれか一つ
    ## レコードを一つ取得？
    @sample_illustration = SampleIllustration.find(params[:id])

    ## サンプル情報 アップデート
    if  @sample_illustration.update(sample_illustration_params)

      ## flash[:notice] は 投稿が成功した時だけ表示
      ## エラーメッセージでは使わない
      flash[:notice] = "You have updated user successfully."

      ## インスタンス変数 = ユーザー_find 探す:単数でどれか一つ  user_path(@user.id)
      ## 遷移先 '/customer' customer_path(@user.id)
      redirect_to illustration_review_path(@sample_illustration.id)

    else

      ## アクションを実行しない
      render :edit

    end
  end

  ## イラスト_画像_削除する(単体) illustration/:id
  def destroy
    ## データ(レコード)を一件取得
    @@sample_illustration = SampleIllustration.find(params[:id])

    ## データ（レコード）を削除
    @sample_illustration.destroy

    ## サンプル一覧画面へリダイレクト
    redirect_to illustrations_path
  end

  private
    ## サンプル登録情報編集画面等で使用…
    def sample_illustration_params
      ## params  formから送られてくるデータはparamsの中
      ## require 送信データからモデル名(ここでは:item)を指定し、データを絞り込み
      ## permit  requireで絞り込んだデータの中から、保存を許可するカラムを指定
      params.require(:sample_illustration).permit(:genre_id, :name, :introduction, :image)
    end
end
