module BaseApi
  class API < Grape::API
    format :json
    prefix :api
    mount V1::SongsApi
  end
end