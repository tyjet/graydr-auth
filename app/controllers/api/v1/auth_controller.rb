module Api::V1
  class AuthController < BaseController
    def authenticate
      auth_header = request.headers["Authentication"]

      if auth_header.blank?
        render json: { error: "Unauthenticated!", status: 401 }, status: :unauthorized
        return
      end

      token = request.headers["Authentication"].split
      token_type = token.first

      unless ["Bearer", "Token"].include? token_type
        render json: { error: "Unauthenticated!", status: 401 }, status: :unauthorized
        return
      end

      id_token = token.last.split("=").last
      response = Faraday.get "https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=#{id_token}"

      token_info = JSON.parse response.body

      if token_info["aud"] != ENV["GOOGLE_CLIENT_ID"]
        render json: { error: token_info, status: 401 }, status: :unauthorized
        return
      end

      current_user = User.find_or_create_by(
        given_name: token_info["given_name"],
        family_name: token_info["family_name"],
        email: token_info["email"],
      )
      render json: { user: current_user.uuid }, status: response.status
    end
  end
end
