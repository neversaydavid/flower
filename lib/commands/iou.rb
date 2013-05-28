# encoding: utf-8
require_relative '../debt'

class IOU < Flower::Command
  respond_to "iou"

  class << self
    def description
      "Your bank™, in your chat!"
    end

    def respond message
      from = message.sender[:nick].downcase
      to = message.argument.split(" ").first.downcase
      value = message.argument.split(" ")[1]
      debt = Debt.new(from: from, to: to, value: value.to_i)

      if to && value
        debt.create!
        message.paste "Debt to #{to.capitalize} registered for #{value} SEK, total debt: #{debt.total}"
      elsif to
        message.paste "You owe #{debt.total} SEK to #{to.capitalize}"
      end
    end
  end
end