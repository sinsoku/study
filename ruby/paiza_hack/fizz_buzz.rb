require 'json'
require 'net/http'

PAIZA_API_URL = 'http://api.paiza.io/runners/create'
SLACK_API_URL = '<Slack Incoming WebHook URL>'
MAX_SIZE = 10
SOURCE = File.read(__FILE__)

def fizzbuzz(n)
  [].tap do |arr|
    arr << 'Fizz' if (n % 3).zero?
    arr << 'Buzz' if (n % 5).zero?
    arr << n.to_s if arr.empty?
  end.join(" ")
end

def post_runners(input)
  uri = URI.parse(PAIZA_API_URL)
  options = { language: :ruby, source_code: SOURCE, api_key: :guest }
  res = Net::HTTP.post_form(uri, options.merge(input: input))
  p input
  p options
  p res
  p res.body
end

def post_slack(text)
  uri = URI.parse(SLACK_API_URL)
  res = Net::HTTP.post_form(uri, payload: JSON.dump(text: text))
  p res
  p res.body
end

def main(accumulator, n)
  result = [].tap do |arr|
    arr << accumulator unless accumulator.empty?
    arr << fizzbuzz(n)
  end.join(', ')

  input = "#{result}\n#{n.next}"
  if n < MAX_SIZE
    post_runners(input)
  else
    post_slack(result)
  end
end

args = $stdin.read.split("\n")
p args
if args.size > 1
  main(args[0], args[1].to_i)
else
  p 'args are required'
end
