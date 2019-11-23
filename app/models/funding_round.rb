class FundingRound
    attr_reader :startup, :venturecapitalist, :type, :investment

    @@all = []

    def initialize startup, venturecapitalist, type, investment
        @startup = startup
        @venturecapitalist = venturecapitalist
        @type = type
        @investment = investment.to_f
        @@all << self
    end

    def self.all
        @@all
    end
end
