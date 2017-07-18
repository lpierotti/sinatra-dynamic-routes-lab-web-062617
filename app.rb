require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!

  get '/reversename/:name' do 
  	@name = params[:name]
  	"#{@name.reverse}"
  end

  get '/square/:number' do 
  	@number = params[:number].to_i
  	"#{@number * @number}"
  end

  get '/say/:number/:phrase' do 
  	@num = params[:number].to_i
  	@phrase = params[:phrase]
  	@phrases = []
  	@num.times {@phrases << @phrase}
  	"#{@phrases.join(" ")}"
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
  	@words = []
  	@words << params[:word1]
  	@words << params[:word2]
  	@words << params[:word3]
  	@words << params[:word4]
  	@words << params[:word5]
  	"#{@words.join(" ")}."
  end

  get '/:operation/:number1/:number2' do 
  	@operation = params[:operation]
  	case @operation
  	when "add"
  		@operation = "+"
  	when "subtract"
  		@operation = "-"
  	when "multiply"
  		@operation = "*"
  	when  "divide"
  		@operation = "/"
  	end 
  	@num1 = params[:number1].to_i
  	@num2 = params[:number2].to_i
  	"#{@num1.public_send @operation, @num2}"
  end
end