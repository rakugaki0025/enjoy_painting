class Public::CommentsController < ApplicationController
  ## enjoy_controller_comments
  
        ## コメント機能
  def create
        ## 投稿画像のIDを取得
      illustration = Illustration.find(params[:illustration_id])
        ## ログインユーザーのコメント情報を作成
      comment = current_customer.comments.new(comment_params)
        ## コメントとイラストの関連付け
      comment.illustration_id = illustration.id
        ## コメントセーブ
      comment.save!
        ## 遷移先 コメントしたページへ
      redirect_to illustration_path(illustration)
    
  end
  
  # def create
    
  #     illustration = Illustration.find(params[:illustration_id])
      
  #     comment = nil
    
  #     if admin.present?
  #         # adminオブジェクトが存在する場合には、コメントをadminに紐付ける
  #       comment = admin.comments.new(comment_params)
    
  #       comment.illustration_id = illustration.id
         
  #       comment.save
         
  #     else
  #       # adminオブジェクトが存在しない場合には、何らかのエラー処理やデフォルトの動作を行う
  #       # 例: エラーメッセージを表示する、コメント投稿を拒否するなど
  #       # ここではコメントを作成せず、何らかの処理を記述します
  #       # 例: エラーメッセージをセットしてリダイレクトするなど
  #     end
  # end
  
  
  
  
    ## コメント削除
  def destroy
            ## コメントデータ取得
      comment = Comment.find(params[:id])
            ## オブジェクト削除
      comment.destroy
            ## 紐づくオブジェクトに代入
        @illusttation = comment.illustration
            ## エラーハンドリングなどの処理を記述する 
        if @illusttation.nil?
            ## nil_classなら アラート表示 
          flash[:alert] = "削除に失敗しました。関連するイラストが見つかりませんでした。"
            ## 遷移先
          redirect_to illustrations_path
          
        else
            ## 遷移先
          redirect_to illustration_path(@illusttation.id), notice: "コメントを削除しました。"
          
        end
      
  end
  
  
  private
  
        ## コメントパラメーター設定
  def comment_params
        ## コメントカラム許可
      params.require(:comment).permit(:content)
    
  end
  
end

