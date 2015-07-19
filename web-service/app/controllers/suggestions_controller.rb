class SuggestionsController < ApplicationController
  include HTTParty

  def index
    email = suggestions_params[:email]
    diseases = suggestions_params[:condition]
    food = suggestions_params[:food]

    get_and_insert_into_db food

    @response = "{
  \"result\": {
    \"recommended\": \"yes\",
    \"reason\": \"NA\"
  },
  \"suggestions\": {
    \"food\": [
      \"Apple\",
      \"Banana\",
      \"Grapes\",
      \"Tata\",
      \"Birla\"
    ]
  }
}"
    respond_to do |format|
      format.json { render json: @response }
      format.html { render :index }
    end
  end

  def get_and_insert_into_db(food)
    Food.create({name: food})
    api_key = ENV['USDA_API_KEY']
    base_url = 'http://api.nal.usda.gov/ndb'
    search_url = "#{base_url}/search/?format=json&q=#{food}&sort=r&max=1&offset=0&api_key=#{api_key}"
    ndbno = usda_request(search_url)['list']['item'].first['ndbno']
    reports_url = "#{base_url}/reports/?ndbno=#{ndbno}&type=f&format=json&api_key=#{api_key}"
    response = usda_request(reports_url)
    # insert into nutrients db
    response['report']['food']['nutrients'].each do |nutrient|
      Nutrient.create({name: nutrient['name']})
      FoodNutrient.create({
                              food_id: Food.where(name: food).first.id,
                              nutrient_id: Nutrient.where(name: nutrient['name']).first.id,
                              value: nutrient['value'],
                              unit: nutrient['unit']
                          })
    end
  end

  def usda_request(url)
    JSON.parse(HTTParty.get(url).body)
  end

  def not_in_db?(food)
    list_in_db = Food.where(:name => food)
    return list_in_db.empty?
  end

  private
  def suggestions_params
    params.permit(:email, :condition, :food)
  end
end
