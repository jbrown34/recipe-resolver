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
end
