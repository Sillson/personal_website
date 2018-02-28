class CustomMailForm
  require 'sendgrid-ruby'
  include SendGrid

  def initialize
    @sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  end

  def send_mail(sender, message)
    data = JSON.parse(
      <<-HEREDOC
      {
        "personalizations": [
          {
            "to": [
              {
                "email": "stuartillson@gmail.com"
              }
            ],
            "subject": "New website email from #{sender} at #{DateTime.now}"
          }
        ],
        "from": {
          "email": "#{sender}"
        },
        "content": [
          {
            "type": "text/plain",
            "value": "#{message}"
          }
        ]
      }
      HEREDOC
    )

    response = @sg.client.mail._("send").post(request_body: data)
    response.status_code
  end
end