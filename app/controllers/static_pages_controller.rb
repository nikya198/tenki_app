class StaticPagesController < ApplicationController
  def home
    require 'open-uri'
    url = 'https://weather.yahoo.co.jp/weather/jp/14/4610/14133.html'
    doc = Nokogiri::HTML(open(url))
    @array = []
    doc.xpath('//div[@id="yjw_pinpoint_today"]/table[@class="yjw_table2"]/tr/td/img/@alt').each do |node|
      @array << node.text()
    end
  end
end
