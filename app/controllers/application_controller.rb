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

end
