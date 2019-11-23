class Startup
    attr_reader :name, :founder, :domain

    @@all = []

    def initialize name, founder, domain
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
            self.instance_variable_set(:@domain, domain)
            self.instance_variable_set(:@name, name)
    end

    def self.find_by_founder(founder_name)
        Startup.all.find do |startup|
            if startup.founder == founder_name
                puts startup.name
            end
        end
    end

    def self.domains
        Startup.all.map do |startup|
            startup.domain
        end
    end

    def sign_contract(venturecapitalist, type, investment)
        FundingRound.new(self, venturecapitalist, type, investment)
    end

    def num_funding_rounds
        array = []
        FundingRound.all.select do |round|
            if round.startup == self
                array << round
            end
        end
        array.length
    end

    def total_funds
        sum = 0
        FundingRound.all.select do |round|
            if round.startup == self
                sum += round.investment
            end
        end
        sum
    end

    def big_investors
        array = []
        FundingRound.all.select do |round|
            if round.startup == self && VentureCapitalist.tres_commas_club.include?(round.venturecapitalist)
                array << round.venturecapitalist
            end
        end
        array.uniq
    end

    def self.all
        @@all
    end
end
