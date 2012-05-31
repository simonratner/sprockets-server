require "rubygems"
require "rack"
require "sprockets"

require "coffee-script"
require "sass"

app = Rack::Builder.app do

    map '/' do
        run Sprockets::Environment.new.tap {|e|
            ARGV.each {|path| e.append_path path}
        }
    end

end

Rack::Server.start :app => app, :Port => 9494
