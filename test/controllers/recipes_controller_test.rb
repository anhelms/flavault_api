require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/recipes.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Recipe.count, data.length
  end

  test "create" do
    assert_difference "Recipe.count", 1 do
      post "/recipes.json", params: { title: "Cooked Eggs", prep_time: 5, servings: 1, description: "2 sunny side up eggs", ingredients: "2 eggs", directions: "Crack open two egg shells into a pan and fry until desired level of cooked", chef: "Anna Helms", image_url: "https://www.southernliving.com/thmb/NDuJP6OZAhYDO-3xexTbcdxZGds=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Sunny_Side_Up_Eggs_008-c7f1db520c2a476db6b9e84e60f8c119.jpg" }
      assert_response 200
    end
  end

  test "show" do
    get "/recipes/#{Recipe.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "title", "prep_time", "servings", "description", "ingredients", "directions", "chef", "image_url", "created_at", "updated_at"], data.keys
  end

  test "update" do
    recipe = Recipe.first
    patch "/recipes/#{recipe.id}.json", params: { title: "Updated title" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated title", data["title"]
  end

  test "destroy" do
    assert_difference "Recipe.count", -1 do
      delete "/recipes/#{Recipe.first.id}.json"
      assert_response 200
    end
  end
end
