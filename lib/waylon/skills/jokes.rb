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
          f.response :json
        end
        response = conn.get("https://icanhazdadjoke.com/")

        reply(response.body["joke"])
      rescue Faraday::Error
        reply(fallback)
      end

      def fallback
        [
          "I was addicted to the hokey pokey…but I turned myself around.",
          "What invention allows us to see through walls? Windows.",
          "The past, the present, and the future walked into a bar. It was tense.",
          "What's the least-spoken language in the world? Sign language.",
          "Why do cows wear bells? Because their horns don't work.",
          "Police arrested a bottle of water because it was wanted in three different states: solid, liquid, and gas."
        ].sample
      end
    end
  end
end
