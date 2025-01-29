class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all 
        render :index
    end

    def create
        @recipe = Recipe.create(
            title: params[:title],
            prep_time: params[:prep_time],
            servings: params[:servings],
            description: params[:description],
            ingredients: params[:ingredients],
            directions: params[:ingredients],
            chef: params[:chef],
            image_url: params[:image_url],
        )
        render :show
    end

    def show
        @recipe = Recipe.find_by(id: params[:id])
        render :show
    end

    def update
        @recipe = Recipe.find_by(id: params[:id])
        @recipe.update(
            title: params[:title] || @recipe.title,
            prep_time: params[:prep_time] || @recipe.prep_time,
            servings: params[:servings] || @recipe.servings,
            description: params[:description] || @recipe.description,
            ingredients: params[:ingredients] || @recipe.ingredients,
            directions: params[:directions] || @recipe.directions,
            chef: params[:chef] || @recipe.chef,
            image_url: params[:image_url] || @recipe.image_url,
        )
        render :show
    end
end
