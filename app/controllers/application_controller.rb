class ApplicationController < ActionController::Base
  def hello
    render html: 'hello, word'
  end

  def home;  end

  def about; end

  def help; end
end
