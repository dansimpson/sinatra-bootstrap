module Bootstrap
  class Application < Sinatra::Base
  
    # Setup reloader and watch rb files
    configure :development do
      register Sinatra::Reloader
      also_reload "lib/*.rb"
    end

    set :sass, { 
      :load_paths => [ "assets/stylesheets" ] 
    }

    helpers Sinatra::ContentFor

    # Used for generating asset bundles
    # Similar to Rails asset pipline
    register Sinatra::AssetPack


    # Asset pipeline setup
    assets do

      serve "/js",     from: "assets/javascripts"
      serve "/css",    from: "assets/stylesheets"
      serve "/images", from: "assets/images"

      js_compression :uglify

      js :application, [
        "/js/vendor/jquery.js",
        "/js/application.js"
      ]

      css :application, [
        "/css/vendor/*.css",
        "/css/*.css"
      ]

      prebuild true
    end

    ###
    # Application
    ###

    get "/" do
      @name = params[:name]
      haml :index
    end

  end
end