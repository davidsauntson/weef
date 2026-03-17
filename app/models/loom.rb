class Loom
    attr_reader :shafts, :treadles, :tieup

    def initialize(attributes, tieup_data)
        @shaft_count = attributes[:shafts].to_i
        @treadle_count = attributes[:treadles].to_i
        @rising_shed = true # TODO: cater for sinking sheds
        @tieup_data = tieup_data

        create_shafts
        create_treadles
        create_tieup
    end

    def rising_shed?
        @rising_shed
    end

    def create_shafts
        @shafts = Array.new(@shaft_count) { |i| Shaft.new(i + 1) }
    end

    def create_treadles
        @treadles = Array.new(@treadle_count) { |i| Treadle.new(i + 1) }
    end

    def create_tieup
        @tieup = Tieup.new(@tieup_data, @shafts, @treadles)
    end
end
