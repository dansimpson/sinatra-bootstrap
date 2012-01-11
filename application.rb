module Bootstrap
  class Application < Sinatra::Base
  
    configure :development do
      register Sinatra::Reloader
    end
        
    get "/" do
      @name = params[:name]
      haml :index
    end

  end
end