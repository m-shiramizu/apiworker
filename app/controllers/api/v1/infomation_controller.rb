module Api
  module V1
     class InfomationController < ApplicationController
       before_action :check_accesstoken

       def show
         info = { data1: 'data1', data2: 'data2' }
         render json: info
       end
     end
  end
end
