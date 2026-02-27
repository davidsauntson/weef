class HomeController < ApplicationController
  def index
    wif_data = WifSplitter.new(File.join(Rails.root, "/test/fixtures/files/full.wif")).split_wif

    @weave = Weave.new(wif_data[:text][:data])
  end
end
