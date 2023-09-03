FactoryBot.define do
  factory :ticket do
    request_number { '09252012-00001' }
    sequence_number { '2421' }
    request_type { 'Normal' }
    request_action { 'Restake' }
    response_due_date { '2011-07-13 23:59:59' }
    sacode_primary { 'ZZGL103' }
    sacode_additional { 'ZZL01,ZZL02,ZZL03' }
    well_known_text { 'POLYGON((-81.13390268058475 32.07206917625161, ...))' }
  end
end
