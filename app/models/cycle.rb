class Cycle
    attr_reader :pattern, :repeats

    def initialize(pattern:, repeats:)
        @pattern = pattern
        @repeats = repeats
    end
end
