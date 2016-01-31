class Food < ActiveRecord::Base

  validates :name, :presence => true
  validates :calories, :presence => true
  has_and_belongs_to_many :users

  require "nutritionix/api_1_1"

  def provider
    app_id = Figaro.env.nutritionix_app_id
    app_key = Figaro.env.nutritionix_app_key
    Nutritionix::Api_1_1.new(app_id, app_key)
  end

  def search_api_for(query)
    search_params = {
      limit: 30,
      fields: ['item_name', 'nf_calories'],
      query: query
    }

    results_json = provider.nxql_search(search_params)
    results = JSON.parse(results_json)
    results.fetch("hits") if results.key?("hits")
  end


end
