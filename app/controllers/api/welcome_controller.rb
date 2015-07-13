module Api
  class WelcomeController < ApplicationController

    protect_from_forgery except: :ifttt_test_setup

    DATA = [
        {
          "image_url": "http://example.com/images/128",
          "title": "Banksy takes the BK",
          "tags": "banksy, brooklyn",
          "posted_at": "2015-11-04T09:23:00-07:00",
          "created_at": Time.now.iso8601,
          "id": SecureRandom.hex(10),
          "meta": {
            "id": SecureRandom.hex(10),
            "timestamp": 1383597267
          }
        },
        {
          "image_url": "http://example.com/images/125",
          "title": "Banksy takes Manhattan",
          "tags": "banksy, nyc",
          "posted_at": "2013-11-04T03:23:00-07:00",
          "created_at": (Time.now - 3.hours).iso8601,
          "id": SecureRandom.hex(8),
          "meta": {
            "id": SecureRandom.hex(10),
            "timestamp": 1383580355
          }
        },
        {
          "image_url": "http://example.com/images/124",
          "tags": "banksy, paris",
          "title": "Banksy takes Paris, oui oui",
          "posted_at": "2013-11-04T03:23:00-07:00",
          "created_at": (Time.now - 1.day).iso8601,
          "id": SecureRandom.hex(7),
          "meta": {
            "id": SecureRandom.hex(10),
            "timestamp": 1383550124
          }
        }
      ]

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
            "samples": {
              "triggers":
                {
                  "data": DATA
                }
            },
          }
        }, status: 200
      else
        render json: {}, status: 401
      end
    end

    def ifttt_trigger
      data = DATA
      if JSON.parse(request.body.read).has_key?('limit')
        data = JSON.parse(request.body.read)['limit'].to_i == 1 ? DATA[0..0] : []
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

  end
end
