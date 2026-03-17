# frozen_string_literal: true

class TieupDescriptionComponent < ViewComponent::Base
  attr_reader :treadles

  def initialize(treadles)
    @treadles = treadles
  end

  def shaft_ids_for_treadle(treadle)
    return " - " if treadle.shafts.empty?

    treadle.shafts.map(&:id).join(", ")
  end
end
