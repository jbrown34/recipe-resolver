# == Schema Information
#
# Table name: recipes
#
#  id             :integer          not null, primary key
#  description    :string
#  ingredients    :string
#  minutes        :integer
#  n_ingredients  :string
#  n_steps        :integer
#  name           :string
#  nutrition      :string
#  steps          :string
#  tags           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  contributor_id :integer
#
class Recipe < ApplicationRecord
  belongs_to(:contributor, { :required => false, :class_name => "User", :foreign_key => "contributor_id" })
  has_many(:likes, { :class_name => "Bookmark", :foreign_key => "recipe_id", :dependent => :destroy })
  validates(:steps, { :presence => { :message => "You must give a description of the steps to make this recipe" } })
  validates(:name, { :presence => { :message => "Please enter a name for the recipe! " } })
  validates(:name, { :uniqueness => { :scope => ["n_steps"], :message => "This recipe already exists" } })
  validates(:n_steps, { :presence => { :message => "Please enter the number of steps" } })
  validates(:minutes, { :length => { :minimum => 0, :maximum => 3 } })
  validates(:minutes, { :presence => true })
  validates(:description, { :presence => true })
end
