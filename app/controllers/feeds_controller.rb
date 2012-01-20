class FeedsController < ApplicationController
  before_filter :login_from_api_key
  
  def show
    if @user
      mentions = @user.get_mentions
      result_text = ""
      mentions.each do |mention|
        result_text += "<tweet>#{mention}</tweet>\n"
      end
      render :text => result_text
    else
      render :text => "no user found"
    end
  end
  
  def login_from_api_key
    @user ||= User.find_by_api_key(params[:api_key])
  end
end
