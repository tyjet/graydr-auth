module Api
  class ApiController < ApplicationController
    include ActionController::MimeResponds

    respond_to :json
  end
end
