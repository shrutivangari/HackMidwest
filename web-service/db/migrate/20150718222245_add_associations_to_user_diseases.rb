class AddAssociationsToUserDiseases < ActiveRecord::Migration
  def change
    add_reference :user_diseases, :user, index: true
    add_foreign_key :user_diseases, :users
    add_reference :user_diseases, :disease, index: true
    add_foreign_key :user_diseases, :diseases
  end
end
