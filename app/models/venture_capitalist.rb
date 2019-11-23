class VentureCapitalist
    attr_reader :name, :total_worth
    
    @@all = []

    def initialize name, total_worth
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.tres_commas_club
        VentureCapitalist.all.select do |venturecapitalist|
            if venturecapitalist.total_worth > 1000000000
                puts venturecapitalist
            end
        end
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        array = []
        FundingRound.all.select do |round|
            if round.venturecapitalist == self
                array << round
            end
        end
        array.length
    end

    def portfolio
        array =[]
        FundingRound.all.select do |round|
            if round.venturecapitalist == self
                array << round.startup
            end
        end
        array.uniq
    end

    def biggest_investment
        array = []
        FundingRound.all.select do |round|
            if round.venturecapitalist == self
                array << round
            end
        end
        array.max_by{|round| round.investment}
    end

    def invested(domain)
        total_invested = 0
        FundingRound.all.select do |round|
            if round.venturecapitalist == self && round.startup.domain == domain            
                total_invested += round.investment
            end
        end
        total_invested
    end

    def self.all
        @@all
    end
end
