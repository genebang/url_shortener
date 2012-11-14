class UrlsController < ApplicationController
  
  def index
    @urls = Url.all
  end
  
  def new
    @url = Url.new
  end
  
  def create
    @user = User.find(params[:user_id])
    # @url = @user.urls.build(params[:url])
    
    if params[:url][:short_url] == ""
      @url = @user.urls.build(:original_url => params[:url][:original_url],
                              :short_url => short_url(params[:url][:original_url]))
    else
      @url = @user.urls.build(:original_url => params[:url][:original_url],
                             :short_url => params[:url][:short_url])
    end
    
    if @url.save
      # redirect_to @user
      # redirect_to urls_path
      redirect_to :controller => 'users', :action => 'index', :id => @user.id
    else
      redirect_to user_urls_path
    end
    
    # # @url = Url.new(params[:url])
    # if params[:url][:short_url] == ""
    #   @url = Url.new(:original_url => params[:url][:original_url],
    #                  :short_url => short_url(params[:url][:original_url]))
    # else
    #   @url = Url.new(:original_url => params[:url][:original_url],
    #                  :short_url => params[:url][:short_url])
    # end
    # 
    # if @url.save
    #   redirect_to @url
    #   # redirect_to urls_path
    # else
    #   redirect_to new_user_url_path
    # end
  end
  
  def show
    # @url = Url.find_by_id(params[:id])
    @url = Url.find(params[:id])
  end
  
  def go_to_url
    @url = Url.find_by_short_url!(params[:short_url])
    @url.count += 1
    @url.save
    redirect_to @url.original_url
  end
    
  
  private
  
  def short_url(long_url)
    (('a'..'z').to_a + ('A'..'Z').to_a + (1..9).to_a).shuffle[0..5].join
  end
  
end
