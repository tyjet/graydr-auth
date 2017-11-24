module Api::V1
  VERSION = '1.0'

  class BaseController < Api::ApiController

    private
      def version
        VERSION
      end

  end
end
