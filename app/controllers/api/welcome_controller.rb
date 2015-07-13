module Api
  class WelcomeController < ApplicationController

    before_filter :get_data, only: [:ifttt_test_setup, :ifttt_trigger]
    protect_from_forgery except: :ifttt_test_setup

    # GET /welcome
    def index
      render json: { data: 'json baby'}, status: 200
    end

    def ifttt_status
      if request.headers["IFTTT-Channel-Key"] == ENV['IFTTT_Channel_Key']
        render json: {}, status: 200
      else
        render json: {}, status: 401
      end
    end

    def ifttt_test_setup
      if request.headers["IFTTT-Channel-Key"] == ENV['IFTTT_Channel_Key']
        render json: {
          "data": {
            "samples": {
              "triggers":
                {
                  "data": @data
                }
            },
          }
        }, status: 200
      else
        render json: {}, status: 401
      end
    end

    def ifttt_trigger
      data = @data
      if JSON.parse(request.body.read).has_key?('limit')
        data = JSON.parse(request.body.read)['limit'].to_i == 1 ? @data[0..0] : []
      end
      if request.headers["IFTTT-Channel-Key"] == ENV['IFTTT_Channel_Key']
        render json: {
          "data": data
        }, status: 200
      else
        render json: {
            'errors': [
              {
                "message": "Invalid IFTTT channel key!"
              }
            ]
          }, status: 401
      end
    end

  protected

    def get_data
      @data = Welcome::DATA
    end

  end
end
