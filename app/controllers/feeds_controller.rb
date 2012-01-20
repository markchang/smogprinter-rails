class FeedsController < ApplicationController
  before_filter :login_from_api_key
  
  def show
    if !@user
      head :unauthorized
    else
      mentions = @user.get_mentions
      result_text = ""
      mentions.each do |mention|
        result_text += "<tweet>#{mention}</tweet>\n"
      end
      render :text => result_text
    end
  end
  
  def login_from_api_key
    @user ||= User.find_by_api_key(params[:api_key])
  end
end
