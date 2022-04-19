require "mandrill"

class BaseMandrilMailer < ActionMailer::Base
  default(
    from: "hello@gourmetpro.co"
    reply_to: "hello@gourmetpro.co"
  )

  private

  def send_mail(email, subject, body)
    mail(to: email, subject: subject, body: body, conent_type: "text/html")
  end

  def mandrill_tamplate(template_name, attributes)
    mandrill = Mandrill::API.new(ENV["SMTP_PASSWORD"])

    merge_vars = attributes.map do |key, value|
      { name: key, content: value }
    end

    mandrill.templates.render(template_name, [], merge_vars)["html"]
  end
end
