# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
disease_seeds = [
  {name: 'Arthritis', description: 'Inflammation of one or more joints, causing pain and stiffness that can worsen with age.'},
  {name: 'Hypovitaminosis D', description:'Too little vitamin D in the body.'},
  {name: 'Hypertension', description:'High Blood Pressure - A condition in which the force of the blood against the artery walls is too high.'},
  {name: 'Hypotension', description:'Low blood pressure, especially in the arteries of the systemic circulation'},
  {name: 'Diabetes', description:'A group of diseases that result in too much sugar in the blood, or high blood glucose.'},
  {name: 'Kidney Stones', description:'A small, hard deposit that forms in the kidneys and is often painful when passed.'},
  {name: 'Common Cold', description:'A common viral infection of the nose and throat.'},
  {name: 'Hypercholesterolemia', description:'High amounts of cholesterol in the blood.'},
  {name: 'Cancer', description:''},
  {name: 'Cardiovascular Disease', description:''},
  {name: 'Cataract', description:''},
  {name: 'Anemia', description:''},
]

food_seeds = [
  {name:'Soy Sauce', description:'Junk'},
  {name:'Soda', description:'Junk'},
  {name:'Coffee', description:''},
  {name:'Pizza', description:'Junk'},
  {name:'Lemon', description:'Vegetable'},
  {name:'Tomato', description:'Fruit'},
  {name:'Oily fish', description:'Seafood'},
  {name:'Apple', description:'Fruit'},
  {name:'Spinach', description:'Vegetable'},
  {name:'Beef', description:'Meat'},
  {name:'Liver', description:'Meat'},
  {name:'Egg', description:'Ovo'},
  {name:'Shrimp', description:'Seafood'},
  {name:'Fish', description:'Seafood'},
  {name:'Fortified Milk', description:'Vegetable'},
  {name:'Cheddar', description:'Vegetable'},
  {name:'Cheese', description:'Vegetable'},
  {name:'Sweet Potato', description:'Vegetable'},
  {name:'Carrot', description:'Vegetable'},
  {name:'Pumpkin', description:'Vegetable'},
  {name:'Squash', description:'Vegetable'},
  {name:'Mango', description:'Vegetable'},
  {name:'Tuna', description:'Seafood'},
  {name:'Walnuts', description:'nuts'},
  {name:'Almonds', description:'nuts'},
  {name:'Avocado', description:'Fruit'},
  {name:'Cookies', description:'Junk'},
  {name:'Chocolate', description:'Junk'}
]

nutrient_seeds = [
  {name:'Water', description: 'Proximate'},
  {name:'Energy', description: 'Proximate'},
  {name:'Total lipid(fat)', description: 'Proximate'},
  {name:'Carbohydrate, by difference', description: 'Proximate'},
  {name:'Fiber, total diatery', description: 'Proximate'},
  {name:'Sugars, total', description: 'Proximate'},
  {name:'Calcium, Ca', description: 'Proximate'},
  {name:'Iron, Fe', description: 'Mineral'},
  {name:'Magnesium, Mg', description: 'Mineral'},
  {name:'Phosphorous, P', description: 'Mineral'},
  {name:'Potassium, K', description: 'Mineral'},
  {name:'Sodium, Na', description: 'Mineral'},
  {name:'Zinc, Z', description: 'Mineral'},
  {name:'Vitamin C, total ascorbic acid', description: 'Vitamin'},
  {name:'Thiamin', description: 'Vitamin'},
  {name:'Riboflavin', description: 'Vitamin'},
  {name:'Niacin', description: 'Vitamin'},
  {name:'Vitamin B-6', description: 'Vitamin'},
  {name:'Folate, DFE', description: 'Vitamin'},
  {name:'Vitamin B-12', description: 'Vitamin'},
  {name:'Vitamin A, RAE', description: 'Vitamin'},
  {name:'Vitamin A, IU', description: 'Vitamin'},
  {name:'Vitamin E(alpha-tocopherol', description: 'Vitamin'},
  {name:'Vitamin D(D2 + D3)', description: 'Vitamin'},
  {name:'Vitamin D', description: 'Vitamin'},
  {name:'Vitamin K', description: 'Vitamin'},
  {name:'Fatty acids, total saturated', description: 'lipid'},
  {name:'Fatty acids, total monosaturated', description: 'lipid'},
  {name:'Fatty acids, total polysaturated', description: 'lipid'},
  {name:'Fatty acids, total trans', description: 'lipid'},
  {name:'Cholesterol', description: 'lipid'},
  {name:'Caffeine', description: 'lipid'}
]

ChemicalCompoundNutrient.delete_all
RecommendedChemical.delete_all
ChemicalCompoundFood.delete_all
ChemicalCompound.delete_all
UserDisease.delete_all
RecommendedRange.delete_all
Disease.delete_all
Nutrient.delete_all
User.delete_all
Food.delete_all

disease_seeds.each { |cs| Disease.create(cs) }
food_seeds.each { |is| Food.create(is) }
nutrient_seeds.each { |cs| Nutrient.create(cs) }

chemical_compound_seeds = [
    {name: 'retinol'},
    {name: 'beta-carotine'},
    {name: 'calciferol'},
    {name: 'fatty-acids'},
    {name: 'sodium'},
    {name: 'oxalate'}
]

ChemicalCompound.delete_all
chemical_compound_seeds.each { |cs| ChemicalCompound.create(cs) }

chemical_compound_nutrient_seeds = [
    {nutrient_id: Nutrient.where(name: 'Vitamin A, RAE').first.id, chemical_compound_id: ChemicalCompound.where(name: 'retinol').first.id},
    {nutrient_id: Nutrient.where(name: 'Vitamin A, RAE').first.id, chemical_compound_id: ChemicalCompound.where(name: 'beta-carotine').first.id},
    {nutrient_id: Nutrient.where(name: 'Vitamin D').first.id, chemical_compound_id: ChemicalCompound.where(name: 'calciferol').first.id},
    {nutrient_id: Nutrient.where(name: 'Sodium, Na').first.id, chemical_compound_id: ChemicalCompound.where(name: 'sodium').first.id}
]

recommended_chemical_seeds = [
    {disease_id: Disease.where(name: 'Cancer').first.id, chemical_compound_id: ChemicalCompound.where(name: 'beta-carotine').first.id, recommended: '1'},
    {disease_id: Disease.where(name: 'Cardiovascular Disease').first.id, chemical_compound_id: ChemicalCompound.where(name: 'beta-carotine').first.id, recommended: '1'},
    {disease_id: Disease.where(name: 'Cataract').first.id, chemical_compound_id: ChemicalCompound.where(name: 'beta-carotine').first.id, recommended: '1'},
    {disease_id: Disease.where(name: 'Hypercholesterolemia').first.id, chemical_compound_id: ChemicalCompound.where(name: 'fatty-acids').first.id, recommended: '1'},
    {disease_id: Disease.where(name: 'Hypotension').first.id, chemical_compound_id: ChemicalCompound.where(name: 'sodium').first.id, recommended: '1'},
    {disease_id: Disease.where(name: 'Kidney Stones').first.id, chemical_compound_id: ChemicalCompound.where(name: 'oxalate').first.id, recommended: '0'}
]

chemical_compound_food_seeds = [
    {food_id: Food.where(name:'Beef').first.id, chemical_compound_id: ChemicalCompound.where(name:'retinol').first.id},
    {food_id: Food.where(name:'Liver').first.id, chemical_compound_id: ChemicalCompound.where(name:'retinol').first.id},
    {food_id: Food.where(name: 'Egg').first.id, chemical_compound_id: ChemicalCompound.where(name:'retinol').first.id},
    {food_id: Food.where(name: 'Shrimp').first.id, chemical_compound_id: ChemicalCompound.where(name:'retinol').first.id},
    {food_id: Food.where(name: 'Fish').first.id, chemical_compound_id: ChemicalCompound.where(name:'retinol').first.id},
    {food_id: Food.where(name: 'Fortified Milk').first.id, chemical_compound_id: ChemicalCompound.where(name:'retinol').first.id},
    {food_id: Food.where(name: 'Cheddar').first.id, chemical_compound_id: ChemicalCompound.where(name:'retinol').first.id},
    {food_id: Food.where(name: 'Cheese').first.id, chemical_compound_id: ChemicalCompound.where(name:'retinol').first.id},
    {food_id: Food.where(name: 'Sweet Potato').first.id, chemical_compound_id: ChemicalCompound.where(name:'beta-carotine').first.id},
    {food_id: Food.where(name: 'Carrot').first.id, chemical_compound_id: ChemicalCompound.where(name:'beta-carotine').first.id},
    {food_id: Food.where(name: 'Pumpkin').first.id, chemical_compound_id: ChemicalCompound.where(name:'beta-carotine').first.id},
    {food_id: Food.where(name: 'Squash').first.id, chemical_compound_id: ChemicalCompound.where(name:'beta-carotine').first.id},
    {food_id: Food.where(name: 'Mango').first.id, chemical_compound_id: ChemicalCompound.where(name:'beta-carotine').first.id},
    {food_id: Food.where(name: 'Tuna').first.id, chemical_compound_id: ChemicalCompound.where(name:'fatty-acids').first.id},
    {food_id: Food.where(name: 'Walnuts').first.id, chemical_compound_id: ChemicalCompound.where(name:'fatty-acids').first.id},
    {food_id: Food.where(name: 'Almonds').first.id, chemical_compound_id: ChemicalCompound.where(name:'fatty-acids').first.id},
    {food_id: Food.where(name: 'Avocado').first.id, chemical_compound_id: ChemicalCompound.where(name:'fatty-acids').first.id},
    {food_id: Food.where(name: 'Soy Sauce').first.id, chemical_compound_id: ChemicalCompound.where(name:'sodium').first.id},
    {food_id: Food.where(name: 'Chocolate').first.id, chemical_compound_id: ChemicalCompound.where(name:'oxalate').first.id},
    {food_id: Food.where(name: 'Spinach').first.id, chemical_compound_id: ChemicalCompound.where(name:'oxalate').first.id}
]

user_seeds = [
    {user_name: 'minion_kevin', first_name: 'Kevin', last_name: 'Minion', date_of_birth:'1970-06-01', gender: 'M'},
    {user_name: 'minion_stuart', first_name: 'Stuart', last_name: 'Minion', date_of_birth:'1980-06-01', gender: 'F'},
    {user_name: 'minion_bob', first_name: 'Bob', last_name: 'Minion', date_of_birth:'1990-06-01', gender: 'M'}
]

user_disease_seeds = [
    {user_id: User.where(user_name: 'minion_kevin'), disease_id: Disease.where(name: 'Hypercholesterolemia')},
    {user_id: User.where(user_name: 'minion_stuart'), disease_id: Disease.where(name: 'Cardiovascular Disease')}
]

recommended_range_seeds = [
    {disease_id: Disease.where(name: 'Hypertension').first.id, nutrient_id: Nutrient.where(name: 'Sodium, Na').first.id, units: 'mg', recommended: '0', min: '1500', max: '1500'},
    {disease_id: Disease.where(name: 'Diabetes').first.id, nutrient_id: Nutrient.where(name: 'Sugars, total').first.id, units: 'g', recommended: '0', min: '5', max:'5'},
    {disease_id: Disease.where(name: 'Hypercholesterolemia').first.id, nutrient_id: Nutrient.where(name: 'Cholesterol').first.id, units: 'mg', recommended: '1', min: '0', max:'1'},
    {disease_id: Disease.where(name: 'Hypercholesterolemia').first.id, nutrient_id: Nutrient.where(name: 'Sugars, total').first.id, units: 'mg', recommended: '1', min:'3', max: '8'},
    {disease_id: Disease.where(name: 'Anemia').first.id, nutrient_id: Nutrient.where(name: 'Caffeine').first.id, units: 'mg', recommended: '0', min:'10', max: '20'},
    {disease_id: Disease.where(name: 'Cataract').first.id, nutrient_id: Nutrient.where(name: 'Sugars, total').first.id, units: 'mg', recommended: '0', min:'10', max: '20'}
]

chemical_compound_nutrient_seeds.each { |cs| ChemicalCompoundNutrient.create(cs) }
recommended_chemical_seeds.each { |cs| RecommendedChemical.create(cs) }
chemical_compound_food_seeds.each { |cs| ChemicalCompoundFood.create(cs) }
user_seeds.each { |cs| User.create(cs) }
user_disease_seeds.each { |cs| UserDisease.create(cs) }
recommended_range_seeds.each { |cs| RecommendedRange.create(cs) }

