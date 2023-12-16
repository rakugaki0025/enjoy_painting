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
     if comment.save!
           ## 遷移先 コメントしたページへ
         redirect_to illustration_path(illustration)
      
     else
          ## 保存できなかった場合,showへ遷移
        render :show
        
     end
      
  end
  
  
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

