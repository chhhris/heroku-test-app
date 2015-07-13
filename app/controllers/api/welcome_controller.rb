module Api
  class WelcomeController < ApplicationController

    protect_from_forgery except: :ifttt_test_setup

    # GET /welcome
    def index
      render json: { data: 'json baby'}, status: 200
    end

    def ifttt_status
      if request.headers["IFTTT-Channel-Key"] == ENV['IFTTT_Channel_Key']
        head :ok
      else
        render json: {}, status: 401
      end
    end

    def ifttt_test_setup
      if request.headers["IFTTT-Channel-Key"] == ENV['IFTTT_Channel_Key']
        render json: {
          "data": {
            "any_new_post": {
              "name": "ChhhrisTest",
              "message": "IFTTT ya heard!?"
            },
          },
        }, status: 200
      else
        render json: {}, status: 401
      end
    end

    def ifttt_trigger
      if request.headers["IFTTT-Channel-Key"] == ENV['IFTTT_Channel_Key']
        render json: {
          "data": [
            {
              "image_url": "http://example.com/images/128",
              "title": "Banksy posty",
              "tags": "banksy, brooklyn",
              "posted_at": "2015-11-04T09:23:00-07:00",
              "meta": {
                "id": "14b9-1fd2-acaa-5df5",
                "timestamp": 1383597267
              }
            },
            {
              "image_url": "http://example.com/images/125",
              "tags": "banksy, nyc",
              "posted_at": "2013-11-04T03:23:00-07:00",
              "meta": {
                "id": "ffb27-a63e-18e0-18ad",
                "timestamp": 1383580355
              }
            },
            {
              "image_url": "http://example.com/images/124",
              "tags": "banksy, paris",
              "posted_at": "2013-11-04T03:23:00-07:00",
              "meta": {
                "id": "ffb27-a63e-18e0-18ad",
                "timestamp": 1383550124
              }
            }
          ]
        }, status: 200
      else
        render json: {}, status: 401
      end
    end

  end
end
