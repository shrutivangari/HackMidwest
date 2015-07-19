class SuggestionsController < ApplicationController
  include HTTParty

  def index
    email = suggestions_params[:email]
    diseases = suggestions_params[:condition]
    food = suggestions_params[:food]

    get_and_insert_into_db food

    @response = getFoodsForRange('260')
#         "{
#   \"result\": {
#     \"recommended\": \"yes\",
#     \"reason\": \"NA\"
#   },
#   \"suggestions\": {
#     \"food\": [
#       \"Apple\",
#       \"Banana\",
#       \"Grapes\",
#       \"Tata\",
#       \"Birla\"
#     ]
#   }
# }"
    respond_to do |format|
      format.json { render json: @response }
      format.html { render :index }
    end
  end

  def get_and_insert_into_db(food)
    Food.create({name: food})
    api_key = 'dl9w9Jhecuwb4txle4kFhT1Zz70bSo9zFwWuXES3'
        # ENV['USDA_API_KEY']
    base_url = 'http://api.nal.usda.gov/ndb'
    search_url = "#{base_url}/search/?format=json&q=#{food}&sort=r&max=1&offset=0&api_key=#{api_key}"
    puts search_url
    ndbno = usda_request(search_url)['list']['item'].first['ndbno']
    reports_url = "#{base_url}/reports/?ndbno=#{ndbno}&type=f&format=json&api_key=#{api_key}"
    puts reports_url
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


  def checkIfICanEatThisFood(food_id, disease_id)
    if(checkForChemical(food_id, disease_id) === false || checkForRange(food_id,disease_id) === false)
      return false
    else
      return true
    end
  end

  def getRecommendedFoods(disease_id)
    food_list = Array.new
    if(getFoodsForChemical(disease_id).length > 0)
      food_list.push(getFoodsForChemical(disease_id))
    end
    if(getFoodsForRange(disease_id).length > 0)
      food_list.push(getFoodsForRange(disease_id))
    end
    return food_list
  end

  def checkForChemical(food_id, disease_id)
    @chemical_id = ChemicalCompoundFood.where(:food_id => food_id).first.chemical_compound_id
    @num = RecommendedChemical.where(:disease_id => disease_id, :chemical_compound_id => @chemical_id).first.recommended
    if(@num == false || @num == 0)
      return false
    else
      return true
    end
  end

  #540, 246

  def checkForRange(food_id, disease_id)
    @nutrient_id_ref = RecommendedRange.where(disease_id: disease_id).pluck(:nutrient_id)
    @unit_ref = RecommendedRange.where(disease_id: disease_id,).pluck(:units)
    @value = FoodNutrient.where(food_id: food_id, unit: @unit_ref, nutrient_id: @nutrient_id_ref).distinct.pluck(:value)
    @minVal = RecommendedRange.where(disease_id: disease_id, units: @unit_ref, nutrient_id: @nutrient_id_ref).distinct.pluck("min")
    @num = RecommendedRange.where(disease_id: disease_id, units: @unit_ref).where("min > ?", @value).pluck(:recommended)
  end

  def getFoodsForChemical(disease_id)
    @chemical_id = RecommendedChemical.where(disease_id: disease_id,recommended: '1').pluck(:chemical_compound_id)
    @food_id = Array.new
    @food_id.push(ChemicalCompoundFood.where(chemical_compound_id:@chemical_id).pluck(:food_id))
    @food_name = Array.new
    @food_name.push(Food.where(id: @food_id).pluck(:name))
    return @food_name
  end

  def getFoodsForRange(disease_id)
    @nutrient_id_ref = RecommendedRange.where(disease_id: disease_id, recommended: '1').pluck(:nutrient_id)
    @food_id = Array.new
    @food_name = Array.new
    for num in @nutrient_id_ref
      @value = FoodNutrient.where(nutrient_id: num).distinct.pluck(:value)
      @minVal = RecommendedRange.where(disease_id: disease_id, nutrient_id: num).pluck(:min)
      @maxVal = RecommendedRange.where(disease_id: disease_id, nutrient_id: num).pluck(:max)
      @food_id.push(FoodNutrient.where(nutrient_id: num).where("value > ?", @minVal).where("value < ?", @maxVal).pluck(:food_id))
      @food_name.push(Food.where(id: @food_id).pluck(:name))
    end
  end
end
