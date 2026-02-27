
class WifSplitter
    attr_accessor :sections

    def initialize(wif_path)
        @wif_path = wif_path
    end

    def split_wif
        wif_content = File.read(@wif_path)
        self.sections = parse_wif_content(wif_content)
    end

    private


    def parse_wif_content(wif_content)
        sections = {}

        section_titles = get_section_titles(wif_content)

        section_titles.each do |section_title|
            section_text = wif_content.match(/\[#{section_title}\]\s*(.*?)(?=^\[.*?\]|\z)/m).to_s
            section_hash = wif_section_to_hash(section_text)
            sections[section_title.parameterize.underscore.to_sym] = section_hash
        end

        sections
    end

    def get_section_titles(wif_content)
        section_titles = []

        wif_content
                .match(/\[CONTENTS\]\s*(.*?)(?=^\[.*?\]|\z)/m)
                .to_s
                .each_line
                .map(&:strip)
                .reject(&:empty?)
                .reject { |section| section.include?("CONTENTS") }
                .map do |section|
                    split_section = section.split("=")
                    next unless ActiveModel::Type::Boolean.new.cast(split_section.last)

                    section_titles << split_section.first.strip
                end

        section_titles
    end

    def wif_section_to_hash(section)
        section_hash = {
            section_title: section.match(/\A\[([^\]]+)\]/).to_s.remove("[", "]").titleize,
            comments: section.scan(/^\s*;\s*(.+)$/).flatten,
            data: parse_values(section)
        }
    end


    def parse_values(section)
        h = section.each_line
            .map(&:strip)
            .reject { |line| line.empty? || line.start_with?("[", ";") }
            .map { |line| line.split("=", 2) }
            .to_h { |key, value| [ key.downcase.to_sym, value.strip ] }
        h
    end
end
