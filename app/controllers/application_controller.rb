class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end
  get "/desserts" do
    Dessert.desserts.to_json
  end
  get "/desserts/:id" do
    dessert = Dessert.find(params[:id])
    dessert.dessert_obj.to_json
  end
  post "/desserts" do
    Dessert.create(
      name: params[:name],
      image: params[:image],
      carbohydrates: params[:carbohydrates],
      proteins: params[:proteins],
      fat: params[:fat],
    )
    dessert_id = Dessert.last.id
    params[:ingredients].each do |ingredient|
      ingredient = Ingredient.find_or_create_by(name: ingredient)
      Recipe.create(
        dessert_id: dessert_id,
        ingredient_id: ingredient.id,
      )
    end
    params[:regimes].each do |regime|
      regime = Regime.find_or_create_by(name: regime)
      Dessert_Regime.create(
        dessert_id: dessert_id,
        regime_id: regime.id,
      )
    end
    Dessert.last.dessert_obj.to_json
  end
  delete "/desserts/:id" do
    recipe = Recipe.where("dessert_id = ?", params[:id])
    dessert_regime = Dessert_Regime.where("dessert_id = ?", params[:id])
    dessert = Dessert.find(params[:id])
    dessert.destroy
    dessert_regime.destroy_all
    recipe.destroy_all
    dessert.to_json
  end


end
