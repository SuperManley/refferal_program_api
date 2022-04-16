Gibbon::Request.api_key = ENV["MAILCHIMP_API_KEY"]
Gibbon::Request.timeout = 15
Gibbon::Request.throws_exceptions = false unless ENV["MAILCHIMP_ENV"] == "development"

if ENV["CONTENTFUL_ENV"] == "development"
  puts "MailChimp API key: #{Gibbon::Request.api_key}"
end
