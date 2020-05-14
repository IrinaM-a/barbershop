require 'sinatra'

get '/' do 
      erb :index
end

post '/' do
      @user_name = params[:user_name]
      @phone     = params[:phone]
      @date_time = params[:date_time]

      @title = "Thank you"
      @message ="Dear #{@user_name}, we'll be waiting for you at  #{@date_time}"
      
      @f = File.open 'users.txt', 'a'
      @f.write "User: #{@user_name}, Phone: #{@phone}, Date and time: #{@date_time}"
      @f.close
      
      erb :message
end

get '/admin' do
      erb :admin
end

post '/admin' do
      @email    = params[:email]
      @password = params[:password]

      if @email == 'metlyakova-i@mail.ru' && @password == 'angel123'
            @a = File.readlines 'users.txt'
            erb :welcome
      else
            erb :admin
      end
end

