class DatenightController < ApplicationController
  def index
  end

  def search
    movies = find_movie(params[:movie])
    unless movies
      flash[:alert] = "Sorry! We can't find a movie"
      return render action: :index
    end
  end
end

private
  def request_api(url)
    response = Excon.get(
      url,
      headers: {
        'X-RapidAPI-Host' => URI.parse(url).host,
        'X-RapidAPI-Key' => ENV.fetch('RAPIDAPI_API_KEY')
      }
    )
    return nil if response.status != 200
    JSON.parse(response.body)
  end
  def find_movie(keyword)
    request_api(
      "moviesdb5.p.rapidapi.com/keyword/#{URI.encode(keyword)}"
    )
  end
