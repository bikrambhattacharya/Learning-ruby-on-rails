class DemoController < ApplicationController

  layout 'application'
  
  def index
    render('demo/index')
  end

  def hello
    @array = [1,2,3,4,5]
    render(:controller=>'demo',:action=>'hello')
  end

  def other_hello
    #redirect_to(:controller=>'demo',:action=>'index')
    redirect_to(:action=>'index')
  end
  
  def google
    redirect_to('https://google.com')
  end
end
