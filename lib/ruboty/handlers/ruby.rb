require "ruboty"

module Ruboty
  module Handlers
    class Ruby < Base
      on(
        /ruby (?<code>.+)/m,
        description: "Evaluate Ruby code",
        name: "evaluate",
      )

      def evaluate(message)
        message.reply(eval(message[:code]))
      rescue => exception
        body = "#{exception.class}: #{exception}"
        message.reply(body)
        Ruboty.logger.debug([body, exception.backtrace].join("\n"))
      end
    end
  end
end
