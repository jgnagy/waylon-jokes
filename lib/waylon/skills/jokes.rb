# frozen_string_literal: true

module Waylon
  module Skills
    # Lets Waylon tell some jokes
    class Jokes < Waylon::Skill
      route(
        /^(tell me a )?joke$/i,
        :tell_a_joke,
        help: {
          usage: "[tell me a] joke",
          description: 'Tells a "dad" joke'
        }
      )

      def tell_a_joke
        conn = Faraday.new(headers: { accept: "application/json" }) do |f|
          f.request :retry
          f.response :json
        end
        response = conn.get("https://icanhazdadjoke.com/")

        reply(response.body["joke"])
      end
    end
  end
end
