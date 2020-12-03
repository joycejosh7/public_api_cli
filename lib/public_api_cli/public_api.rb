class PublicApi
    attr_accessor :api, :description, :link

    @@all = []

    def initialize(api, description, link)
        self.api = api
        self.description = description
        self.link = link
        @@all << self
    end

    def self.all
        @@all.first(100)
    end
end
