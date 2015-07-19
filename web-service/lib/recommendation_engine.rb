module RecommendationEngine
  # class Engine

    def checkIfICanEatThisFood(food_id, disease_id)
      if(checkForChemical(food_id, disease_id) === false || checkForRange(food_id,disease_id) === false)
        return false
      else
        return true
      end
    end

    def getRecommendedFoods(food_id, disease_id)
      food_list = Array.new
      if(getFoodsForChemical(food_id, disease_id).length > 0)
        food_list.push(getFoodsForChemical(food_id, disease_id))
      end
      if(getFoodsForRange(food_id, disease_id).length > 0)
        food_list.push(getFoodsForRange(food_id, disease_id))
      end
      return food_list
    end

    def checkForChemical(food_id, disease_id)
      @chemical_id = ChemicalCompoundFood.where(:food_id => food_id).first.chemical_compound_id
      puts @chemical_id
      @num = RecommendedChemical.where(:disease_id => disease_id, :chemical_compound_id => @chemical_id).first.recommended
      if(@num == false || @num == 0)
        return false
      else
        return true
      end
    end

    #540, 246

    def checkForRange(food_id, disease_id)

    end

    def getFoodsForChemical(food_id, disease_id)
      # return RecommendedChemical.where(:disease_id=>disease_id, :chemical_compound_id => [ChemicalCompoundFood.where(:food_id => food_id).pluck(:chemical_compound_id)], :recommended =>'1').pluck(:)
      Food.where(ChemicalCompoundFood.where(:chemical_compound_id => RecommendedChemical.where(disease_id: disease_id, recommended: '1').pluck(:chemical_compound_id)).pluck(:food_id)).pluck(:name)
    end

    def getFoodsForRange(food_id, disease_id)

    end
  # end
end

# RecommendationEngine.