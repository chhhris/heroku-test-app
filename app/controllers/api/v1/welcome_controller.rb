module Api
  module V1
    class WelcomeController < ApplicationController

      # GET /welcome
      def index
        render json: { data: 'json baby'}, status: 200
      end

      def ifttt_status
        head :ok
      end

      def test

      end

    end
  end
end
