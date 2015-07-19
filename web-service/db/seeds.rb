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
  {name: 'Cataract', description:''}
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
  {name:'Beef', description:'Vegetable'},
  {name:'Liver', description:'Vegetable'},
  {name:'Egg', description:'Vegetable'},
  {name:'Shrimp', description:'Vegetable'},
  {name:'Fish', description:'Vegetable'},
  {name:'Fortified Milk', description:'Vegetable'},
  {name:'Cheddar', description:'Vegetable'},
  {name:'Cheese', description:'Vegetable'},
  {name:'Sweet Potato', description:'Vegetable'},
  {name:'Carrot', description:'Vegetable'},
  {name:'Pumpkin', description:'Vegetable'},
  {name:'Squash', description:'Vegetable'},
  {name:'Mango', description:'Vegetable'}
]

nutrient_seeds = [
  {name:'Water', description: 'Proximate'},
  {name:'Energy', description: 'Proximate'},
  {name:'Total lipid(fat)', description: 'Proximate'},
  {name:'Carbohydrate', description: 'Proximate'},
  {name:'Fiber', description: 'Proximate'},
  {name:'Calcium', description: 'Proximate'},
  {name:'Iron', description: 'Mineral'},
  {name:'Magnesium', description: 'Mineral'},
  {name:'Phosphorous', description: 'Mineral'},
  {name:'Potassium', description: 'Mineral'},
  {name:'Sodium', description: 'Mineral'},
  {name:'Zinc', description: 'Mineral'},
  {name:'Vitamin C', description: 'Vitamin'},
  {name:'Thiamin', description: 'Vitamin'},
  {name:'Riboflavin', description: 'Vitamin'},
  {name:'Niacin', description: 'Vitamin'},
  {name:'Vitamin B6', description: 'Vitamin'},
  {name:'Folate, DFE', description: 'Vitamin'},
  {name:'Vitamin B12', description: 'Vitamin'},
  {name:'Vitamin A, RAE', description: 'Vitamin'},
  {name:'Vitamin A, IU', description: 'Vitamin'},
  {name:'Vitamin E', description: 'Vitamin'},
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

chemical_compound_nutrient_seeds = [
  {nutrient_id: Nutrient.where(name: 'Vitamin A, RAE'), chemical_compound: 'retinol'},
  {nutrient_id: Nutrient.where(name: 'Vitamin A, RAE'), chemical_compound: 'beta-carotine'},
  {nutrient_id: Nutrient.where(name: 'Vitamin D(D2 + D3)'), chemical_compound: 'beta-calciferol'},
  {nutrient_id: Nutrient.where(name: 'Vitamin D'), chemical_compound: 'calciferol'},
  {nutrient_id: Nutrient.where(name: 'Sodium'), chemical_compound: 'sodium'}

]

chemical_compound_disease_seeds = [
  {disease_id: Disease.where(name: 'Cancer'), chemical_compound: 'beta-carotine'},
  {disease_id: Disease.where(name: 'Cardiovascular Disease'), chemical_compound: 'beta-carotine'},
  {disease_id: Disease.where(name: 'Cataract'), chemical_compound: 'beta-carotine'},
  {disease_id: Disease.where(name: 'Hypercholesterolemia'), chemical_compound: 'fatty-acids'},
  {disease_id: Disease.where(name: 'Hypotension'), chemical_compound: 'sodium'}
]

chemical_compound_food_seeds = [
  {food_id: Food.where(name:'Beef'), chemical_compound:'retinol'},
  {name: Food.where(name:'Liver'), chemical_compound:'retinol'},
  {name: Food.where(name: 'Eggs'), chemical_compound:'retinol'},
  {name: Food.where(name: 'Shrimp'), chemical_compound:'retinol'},
  {name: Food.where(name: 'Fish'), chemical_compound:'retinol'},
  {name: Food.where(name: 'Fortified Milk'), chemical_compound:'retinol'},
  {name: Food.where(name: 'Cheddar'), chemical_compound:'retinol'},
  {name: Food.where(name: 'Cheese'), chemical_compound:'retinol'},
  {food_id: Food.where(name:' Sweet Potato'), chemical_compound:'beta-carotine'},
  {name: Food.where(name:'Carrot'), chemical_compound:'beta-carotine'},
  {name: Food.where(name: 'Pumpkin'), chemical_compound:'beta-carotine'},
  {name: Food.where(name: 'Squash'), chemical_compound:'beta-carotine'},
  {name: Food.where(name: 'Mango'), chemical_compound:'beta-carotine'},
  {name: Food.where(name: 'Tuna'), chemical_compound:'fatty-acids'},
  {name: Food.where(name: 'Walnuts'), chemical_compound:'fatty-acids'},
  {name: Food.where(name: 'Almonds'), chemical_compound:'fatty-acids'},
  {name: Food.where(name: 'Avocado'), chemical_compound:'fatty-acids'},
  {name: Food.where(name: 'Soy Sauce'), chemical_compound:'sodium'}
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

# ActiveRecord::Base.connection.execute('TRUNCATE TABLE diseases, foods, nutrients, users RESTART IDENTITY')

Disease.delete_all
Nutrient.delete_all
User.delete_all
Food.delete_all

disease_seeds.each { |cs| Disease.create(cs) }
food_seeds.each { |is| Food.create(is) }
nutrient_seeds.each { |cs| Nutrient.create(cs) }
user_seeds.each { |cs| User.create(cs) }
