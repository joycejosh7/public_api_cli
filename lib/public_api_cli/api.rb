class Api

    def self.get_data
        response =  RestClient.get("https://api.publicapis.org/entries")
        data = JSON.parse(response.body)
       
        data["entries"].each do |public_api_data|
            
            PublicApi.new(public_api_data["API"], public_api_data["Description"], public_api_data["Link"])
        end
       

        
    end
end