#갓태훈 고마워!

require 'mailgun'

class EplController < ApplicationController
  def chelsea
  end

  def tottenham
    @youjacha = params[:title]
    @coffee = params[:content]
    @receiver = params[:receiver]
    
    new_post = Post.new
    new_post.title = @youjacha
    new_post.content = @coffee
    new_post.receiver = @receiver
    new_post.save
    
 
    
    mg_client = Mailgun::Client.new("key-babcdca765844bf3c69ec24b6858cf29")

     message_params =  {
                     from: 'oball910606@gmail.com',
                     to:   @receiver,
                     subject: @youjacha,
                     text:    @coffee
                    }

      result = mg_client.send_message('sandbox394cfd26c974496faac10dfc91a941c5.mailgun.org', message_params).to_h!

      message_id = result['id']
      message = result['message']

    redirect_to "/list"
  end

  def list
    @every_post = Post.all.order("id desc")
  
  end
end
