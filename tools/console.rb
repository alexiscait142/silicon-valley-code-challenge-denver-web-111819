require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

facebook = Startup.new("Facebook", "Zuckerberg", "facebook.com")
myspace = Startup.new("Myspace", "Tom", "myspace.com")
amazon = Startup.new("Amazon", "Bezos", "amazon.com")
twitter = Startup.new("Twitter", "Dorsey", "twitter.com")

internet = VentureCapitalist.new("Internet", 5000000000)
earth = VentureCapitalist.new("Earth", 8000000000)
tesla = VentureCapitalist.new("Telsa", 700)


internetamazonround1 = FundingRound.new(amazon, internet, "monetary", 500)
internetamazonround2 = FundingRound.new(amazon, internet, "monetary", 1000)
earthfacebookround1 = FundingRound.new(facebook, earth, "jobs", 4000)
teslaamazonround1 = FundingRound.new(amazon, tesla, "cars", 5000000)
internetmyspaceround1 = FundingRound.new(myspace, internet, "monetary", 100)




#amazon, whole foods vc, monetary investment, 1000

binding.pry
0 #leave this here to ensure binding.pry isn't the last line