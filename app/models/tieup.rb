class Tieup
    attr_reader :tieup

    def initialize(tieup_data, shafts, treadles)
        @treadles = treadles
        @shafts = shafts

        perform_tieup(tieup_data)
        create_tieup_array(tieup_data)
    end


    # create an array of arrays that represents the tie up for the loom
    # each element in the outer array represents a treadle, and each element in the inner array represents a shaft.
    # The value of the inner array is true if the treadle is connected to the shaft, and false if it is not.
    def create_tieup_array(tieup_data)
        @tieup_array = @treadles.each_with_object([]) do |treadle, tieup_array|
            shafts_for_treadle = Array.new(@shafts.size, false)
            treadle.shafts.map do |shaft|
                shafts_for_treadle[shaft.id - 1] = true
            end
            tieup_array << shafts_for_treadle
        end
    end

    # tie the shafts to the treadles
    def perform_tieup(tieup_data)
        tieup_data.map do |treadle_id, shaft_ids|
            tie_shafts_to_treadle(treadle_id.to_s.to_i, shaft_ids)
        end
    end

    def tie_shafts_to_treadle(treadle_id, shaft_ids)
        shaft_ids.split(",").map(&:to_i).each do |shaft_id|
            treadle = @treadles.find { |t| t.id == treadle_id }
            treadle.shafts << @shafts.find { |s| s.id == shaft_id }
        end
    end
end
