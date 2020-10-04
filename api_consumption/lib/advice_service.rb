require 'faraday'
require 'json'
require 'pry'

class AdviceService

  def initialize

  end

  def conn
    conn = Faraday.new(url: 'https://api.adviceslip.com')
  end

  def random
    request = conn.get('/advice')
    response = JSON.parse(request.body)
  end

  def search(term)
    request = conn.get("/advice/search/#{term}")
    response = JSON.parse(request.body)
  end

end
