module Onebox
  module Engine
    class XkcdOnebox
      include Engine
      include LayoutSupport
      include JSON

      matches_regexp(/^https?:\/\/(www\.)?xkcd\.com\/\d+/)

      def url
        "https://xkcd.com/#{match[:comic_id]}/info.0.json"
      end

      private

      def match
        @match ||= @url.match(%{xkcd\.com/(?<comic_id>\\d+)})
      end

      def data
        {
          url: @url,
          name: raw['safe_title'],
          image: raw['img'],
          description: raw['alt']
        }
      end
    end
  end
end
