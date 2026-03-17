# frozen_string_literal: true

class TieupSvgComponent < ViewComponent::Base
    attr_reader :treadles, :shafts

    def initialize(treadles, shafts)
        @treadles = treadles
        @shafts = shafts
    end
end
