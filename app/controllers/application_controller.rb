class ApplicationController < ActionController::API
  
  rescue_from Exception, with: :handle_500

  def doorkeeper_oauth_client(app_id, app_secret, app_url)
    @client ||= OAuth2::Client.new(app_id,app_secret, :site => app_url)
  end

  private
    def check_accesstoken
      strs = request.env['HTTP_AUTHORIZATION'].split(/[[:space:]]/)
      token = strs[1]
      client = doorkeeper_oauth_client(ENV['DOORKEEPER_APP_ID'],ENV['DOORKEEPER_APP_SECRET'],ENV['DOORKEEPER_APP_URL'])

      accesstoken = OAuth2::AccessToken.new(client,token )
      infomation = accesstoken.get('/api/v1/me.json').parsed

      if infomation.blank?
        render json: { status: 'error'}
      end
    
    end  

    # エラーハンドリング処理
    def handle_500(exception = nil)
      render json: { error: '500 error' }, status: 500
    end


end
