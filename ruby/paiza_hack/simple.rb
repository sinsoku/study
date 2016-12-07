require 'net/http'
PAIZA_API_URL = 'http://api.paiza.io/runners/create'

def post_runners(source_code)
  uri = URI.parse(PAIZA_API_URL)
  options = { language: :ruby, source_code: source_code, api_key: :guest }
  res = Net::HTTP.post_form(uri, options)
  p res
  p res.body
end

source_code = <<-EOF
require 'json'
require 'net/http'
SLACK_API_URL = '<Slack Incoming WebHook URL>'

def post_slack(text)
  uri = URI.parse(SLACK_API_URL)
  res = Net::HTTP.post_form(uri, payload: JSON.dump(text: text))
end

post_slack('hello')
EOF

puts '---'
puts source_code
puts '---'

post_runners(source_code)
