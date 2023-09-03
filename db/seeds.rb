# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
 
include RGeo::ActiveRecord::SpatialToPostGISSql
sample_data = [
  {
    "RequestNumber": "09252012-00001",
    "ReferenceRequestNumber": "",
    "SequenceNumber": "2421",
    "RequestType": "Normal",
    "RequestAction": "Restake",
    "DateTimes": {
      "ResponseDueDateTime": "2011/07/13 23:59:59"
    },
    "ServiceArea": {
      "PrimaryServiceAreaCode": {
        "SACode": "ZZGL103"
      },
      "AdditionalServiceAreaCodes": {
        "SACode": [
          "ZZL01",
          "ZZL02",
          "ZZL03"
        ]
      }
    },
    "Excavator": {
      "CompanyName": "John Doe CONSTRUCTION",
      "Address": "555 Some RD",
      "City": "SOME PARK",
      "State": "ZZ",
      "Zip": "55555",
      "Type": "Excavator",
      "Contact": {
        "Name": "Johnny Doe",
        "Phone": "1115552345",
        "Email": "example@example.com"
      },
      "FieldContact": {
        "Name": "Field Contact",
        "Phone": "1235557924",
        "Email": "example@example.com"
      },
      "CrewOnsite": "true"
    },
    "ExcavationInfo": {
      "DigsiteInfo": {
        "WellKnownText": "POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295,-81.08858407706913 32.02259853170128,-81.05322183341679 32.02434500961698,-81.05047525138554 32.042681017283066,-81.0319358226746 32.06537765335268,-81.01202310294804 32.078469305179404,-81.02850259513554 32.07963291684719,-81.07759774894413 32.07090546831167,-81.12154306144413 32.08806865844325,-81.13390268058475 32.07206917625161))"
      }
    }
  },
  {
    "RequestNumber": "09252012-00002",
    "SequenceNumber": "2422",
    "RequestType": "Normal",
    "RequestAction": "Restake",
    "DateTimes": {
      "ResponseDueDateTime": "2011/07/13 23:59:59"
    },
    "ServiceArea": {
      "PrimaryServiceAreaCode": {
        "SACode": "ZZGL103"
      },
      "AdditionalServiceAreaCodes": {
        "SACode": [
          "ZZL01",
          "ZZL02",
          "ZZL03"
        ]
      }
    },
    "Excavator": {
      "CompanyName": "John Doe CONSTRUCTION",
      "Address": "555 Some RD",
      "City": "SOME PARK",
      "State": "ZZ",
      "Zip": "55555",
      "Type": "Excavator",
      "Contact": {
        "Name": "Johnny Doe",
        "Phone": "1115552345",
        "Email": "example@example.com"
      },
      "FieldContact": {
        "Name": "Field Contact",
        "Phone": "1235557924",
        "Email": "example@example.com"
      },
      "CrewOnsite": "true"
    },
    "ExcavationInfo": {
      "DigsiteInfo": {
        "WellKnownText": "POLYGON((-122.41941642761229 37.7747999817516, -122.41941642761229 37.8047999817516, -122.38941642761229 37.8047999817516, -122.38941642761229 37.7747999817516, -122.41941642761229 37.7747999817516))"
      }
    }
  },
  {
    "RequestNumber": "09252012-00003",
    "SequenceNumber": "2423",
    "RequestType": "Normal",
    "RequestAction": "Restake",
    "DateTimes": {
      "ResponseDueDateTime": "2011/07/13 23:59:59"
    },
    "ServiceArea": {
      "PrimaryServiceAreaCode": {
        "SACode": "ZZGL103"
      },
      "AdditionalServiceAreaCodes": {
        "SACode": [
          "ZZL01",
          "ZZL02",
          "ZZL03"
        ]
      }
    },
    "Excavator": {
      "CompanyName": "John Doe CONSTRUCTION",
      "Address": "555 Some RD",
      "City": "SOME PARK",
      "State": "ZZ",
      "Zip": "55555",
      "Type": "Excavator",
      "Contact": {
        "Name": "Johnny Doe",
        "Phone": "1115552345",
        "Email": "example@example.com"
      },
      "FieldContact": {
        "Name": "Field Contact",
        "Phone": "1235557924",
        "Email": "example@example.com"
      },
      "CrewOnsite": "true"
    },
    "ExcavationInfo": {
      "DigsiteInfo": {
        "WellKnownText": "POLYGON((-74.047852 40.748817, -74.047852 40.748817, -74.047852 40.748817, -74.047852 40.748817, -74.048805 40.748175, -74.049237 40.748671 , -74.048557 40.748867 , -74.048805 40.748175))"
      }
    }
  },
  {
    "RequestNumber": "09252012-00004",
    "SequenceNumber": "2424",
    "RequestType": "Normal",
    "RequestAction": "Restake",
    "DateTimes": {
      "ResponseDueDateTime": "2011/07/13 23:59:59"
    },
    "ServiceArea": {
      "PrimaryServiceAreaCode": {
        "SACode": "ZZGL103"
      },
      "AdditionalServiceAreaCodes": {
        "SACode": [
          "ZZL01",
          "ZZL02",
          "ZZL03"
        ]
      }
    },
    "Excavator": {
      "CompanyName": "John Doe CONSTRUCTION",
      "Address": "555 Some RD",
      "City": "SOME PARK",
      "State": "ZZ",
      "Zip": "55555",
      "Type": "Excavator",
      "Contact": {
        "Name": "Johnny Doe",
        "Phone": "1115552345",
        "Email": "example@example.com"
      },
      "FieldContact": {
        "Name": "Field Contact",
        "Phone": "1235557924",
        "Email": "example@example.com"
      },
      "CrewOnsite": "true"
    },
    "ExcavationInfo": {
      "DigsiteInfo": {
        "WellKnownText": "POLYGON((-73.9815 40.7488,-73.9812 40.7490,-73.9808 40.7487,-73.9811 40.7485,-73.9815 40.7488,-73.9813 40.7487,-73.9810 40.7489,-73.9806 40.7486,-73.9809 40.7484,-73.9813 40.7487))"
      }
    }
  },
  {
    "RequestNumber": "09252012-00005",
    "SequenceNumber": "2425",
    "RequestType": "Normal",
    "RequestAction": "Restake",
    "DateTimes": {
      "ResponseDueDateTime": "2011/07/13 23:59:59"
    },
    "ServiceArea": {
      "PrimaryServiceAreaCode": {
        "SACode": "ZZGL103"
      },
      "AdditionalServiceAreaCodes": {
        "SACode": [
          "ZZL01",
          "ZZL02",
          "ZZL03"
        ]
      }
    },
    "Excavator": {
      "CompanyName": "John Doe CONSTRUCTION",
      "Address": "555 Some RD",
      "City": "SOME PARK",
      "State": "ZZ",
      "Zip": "55555",
      "Type": "Excavator",
      "Contact": {
        "Name": "Johnny Doe",
        "Phone": "1115552345",
        "Email": "example@example.com"
      },
      "FieldContact": {
        "Name": "Field Contact",
        "Phone": "1235557924",
        "Email": "example@example.com"
      },
      "CrewOnsite": "true"
    },
    "ExcavationInfo": {
      "DigsiteInfo": {
        "WellKnownText": "POLYGON((-123.224296 49.261765,-123.224296 49.317841,-123.084062 49.317841,-123.084062 49.261765,-123.224296 49.26176))"
      }
    }
  }
]

(0..4).each do |i|
  json_data = sample_data[i]
  ticket = Ticket.new(
    request_number: json_data[:RequestNumber],
    sequence_number: json_data[:SequenceNumber],
    request_type: json_data[:RequestType],
    request_action: json_data[:RequestAction],
    response_due_date: DateTime.parse(json_data[:DateTimes][:ResponseDueDateTime]),
    sacode_primary: json_data[:ServiceArea][:PrimaryServiceAreaCode][:SACode],
    sacode_additional: json_data[:ServiceArea][:AdditionalServiceAreaCodes][:SACode].join(","),
    well_known_text: RGeo::WKRep::WKTParser.new.parse(json_data[:ExcavationInfo][:DigsiteInfo][:WellKnownText])
  )
  excavator_data = json_data[:Excavator]
  excavator = ticket.build_excavator(
    company_name: excavator_data[:CompanyName],
    address: excavator_data[:Address] + excavator_data[:City] + excavator_data[:State] + excavator_data[:Zip],
    crew_on_site: excavator_data[:CrewOnsite] == "true"
  )
  ticket.save
end