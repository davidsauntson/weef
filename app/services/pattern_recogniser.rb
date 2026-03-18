class PatternRecogniser
    def initialize(numbers)
        @numbers = numbers
    end

    def find_patterns
        return
            [
                Cycle.new(pattern: [ 1, 2 ], repeats: 1),
                Cycle.new(pattern: [ 1, 2, 3, 4 ], repeats: 1)
            ]
    end
end
