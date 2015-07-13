class Welcome < ActiveRecord::Base

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

end
