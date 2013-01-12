require 'sinatra/base'

class App
	get '/' do
		"hello"
	end
end

run App
