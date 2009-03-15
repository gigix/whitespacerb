class WhitespaceController < ApplicationController
  # render index.html.erb
  def index
  end
  
  def encode
    @original = params[:original]
    @whitespaces = Whitespace.encode @original
    render :action => :index
  rescue
    redirect_to :action => :index
  end
  
  def decode
    @whitespaces = params[:whitespaces]
    @original = Whitespace.decode @whitespaces
    render :action => :index
  rescue
    redirect_to :action => :index
  end
end