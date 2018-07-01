module Dajare
  module Helpers
    def dajarize(original)
      Pebbles::Dajare.generate_dajare(original)
    end

    def h(str)
      CGI.escape_html(str.to_s)
    end

    def descriptor
      {
        name: "Dajare",
        description: "An integration for making your rooms cool.",
        key: "com.satoryu.dajare",
        links: {
          homepage: base_url,
          self: "#{base_url}/descriptor"
        },
        capabilities: {
          hipchatApiConsumer: {
            avatar: {
              url: ENV['HIPCHAT_AVATAR_URL']
            },
            scopes: %w[send_message view_messages]
          },
          installable: {
            allowGlobal: true,
            allowRoom: true,
          },
          webhook: [
            {
              name: "simple dajarize",
              key: 'simpel_dajarizer',
              url: "#{base_url}/webhook",
              event: 'room_message',
              pattern: "^.+$",
            }
          ]
        }
      }
    end

    def base_url
      "#{request.scheme}://#{request.host}"
    end
  end
end