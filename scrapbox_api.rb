require "bundler/inline"
require "json"

gemfile do
  source "https://rubygems.org"
  gem "faraday"
  gem "hashie"
end

url = "https://scrapbox.io/api/pages/june29?limit=1000"

response = JSON.parse(Faraday.get(url).body)
data = Hashie::Mash.new(response)

puts (
  data.
  pages.
  reject { _1.title.match(%r[^\d{4}-\d{2}-\d{2} \w{3} :]) }.
  reject { _1.created < Time.new(2023, 1, 1).to_i }.
  sort_by(&:created).
  map { " %s [%s]" % [Time.at(_1.created).strftime("%Y-%m-%d %H:%M"), _1.title] }
)
