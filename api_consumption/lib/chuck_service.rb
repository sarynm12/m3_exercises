require 'faraday'
require 'json'
require 'pry'

class ChuckService

  def conn
    conn = Faraday.new(url: 'https://api.chucknorris.io/jokes')
  end

  def random
    request = conn.get('random')
    response = JSON.parse(request.body, symbolize_names: true)
  end

  def random_in_category(category)
    request = conn.get("random?category=#{category}")
    response = JSON.parse(request.body, symbolize_names: true)
  end

  def categories
    request = conn.get('categories')
    response = JSON.parse(request.body)
  end

  def search(term)
    request = conn.get("search?query=#{term}")
    response = JSON.parse(request.body, symbolize_names: true)
  end

end
