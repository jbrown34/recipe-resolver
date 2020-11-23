class RecipesController < ApplicationController
  def index
    matching_recipes = Recipe.all

    @list_of_recipes = matching_recipes.order({ :created_at => :desc })

    render({ :template => "recipes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_recipes = Recipe.where({ :id => the_id })

    @the_recipe = matching_recipes.at(0)

    render({ :template => "recipes/show.html.erb" })
  end

  def create
    the_recipe = Recipe.new
    the_recipe.minutes = params.fetch("query_minutes")
    the_recipe.contributor_id = params.fetch("query_contributor_id")
    the_recipe.tags = params.fetch("query_tags")
    the_recipe.nutrition = params.fetch("query_nutrition")
    the_recipe.name = params.fetch("query_name")
    the_recipe.n_steps = params.fetch("query_n_steps")
    the_recipe.description = params.fetch("query_description")
    the_recipe.steps = params.fetch("query_steps")
    the_recipe.ingredients = params.fetch("query_ingredients")
    the_recipe.n_ingredients = params.fetch("query_n_ingredients")

    if the_recipe.valid?
      the_recipe.save
      redirect_to("/recipes", { :notice => "Recipe created successfully." })
    else
      redirect_to("/recipes", { :notice => "Recipe failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_recipe = Recipe.where({ :id => the_id }).at(0)

    the_recipe.minutes = params.fetch("query_minutes")
    the_recipe.contributor_id = params.fetch("query_contributor_id")
    the_recipe.tags = params.fetch("query_tags")
    the_recipe.nutrition = params.fetch("query_nutrition")
    the_recipe.name = params.fetch("query_name")
    the_recipe.n_steps = params.fetch("query_n_steps")
    the_recipe.description = params.fetch("query_description")
    the_recipe.steps = params.fetch("query_steps")
    the_recipe.ingredients = params.fetch("query_ingredients")
    the_recipe.n_ingredients = params.fetch("query_n_ingredients")

    if the_recipe.valid?
      the_recipe.save
      redirect_to("/recipes/#{the_recipe.id}", { :notice => "Recipe updated successfully."} )
    else
      redirect_to("/recipes/#{the_recipe.id}", { :alert => "Recipe failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_recipe = Recipe.where({ :id => the_id }).at(0)

    the_recipe.destroy

    redirect_to("/recipes", { :notice => "Recipe deleted successfully."} )
  end
end
