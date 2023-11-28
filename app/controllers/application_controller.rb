class ApplicationController < ActionController::Base
    ## enjoy_app_controllers_application
    ## 全てのコントローラに対する処理を行える権限を持つ
    
    
    ## 意図されたリクエストかを判別,検証する
  protect_from_forgery
  
  
end
