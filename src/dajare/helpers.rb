module Dajare
  module Helpers
    def dajarize(original)
      Pebbles::Dajare.generate_dajare(original)
    end

    def h(str)
      CGI.escape_html(str.to_s)
    end
  end
end