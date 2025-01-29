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
end
