FactoryGirl.define do
  factory :movie do
    id '1'
    title 'StaraWars'
    director 'Thomas'
    rating 'PG'
    release_date {10.years.ago}
  end
end
