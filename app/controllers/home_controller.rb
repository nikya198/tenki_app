class HomeController < ApplicationController
  def index
    @prefectures = Prefecture.all
    c = Prefecture.first
    f = c.prefecture_id
    @cities = City.where(prefecture_id: f)
  end
  def get_cities
    @city = City.where(prefecture_id: params[:prefecture_id])
    # puts "ikuyadesu"
    respond_to do |format|
      format.js
    end
  end
  def search
    require 'open-uri'
    @todayArray = []
    @tomorrowArray = []

    @prefectures = Prefecture.all
    @cities = City.where(prefecture_id: params[:prefecture_id])
    a = City.find_by prefecture_id: params[:prefecture_id]
    ctiyId = a.city_id

    params[:prefecture_id]
    params[:ward_id]
    # 今日の天気（@niftu天気予報)
    url = 'https://weather.nifty.com/cs/catalog/weather_pinpoint/catalog_'+params[:ward_id]+'_1.htm'
    doc = Nokogiri::HTML(open(url).read)
    tem_nodes = doc.css('//div[@id="todayWeather"]/div/table tr:nth-child(2) td/img/@alt').each_with_index do |node,i|
      @hash = {}
      @hash.store("tenki" + i.to_s,node.text())
      if node.text() == "晴れ"
        @hash.store("tenkiId" + i.to_s,1)
      elsif node.text() == "曇り" || node.text() == "くもり"
        @hash.store("tenkiId" + i.to_s,2)
      elsif node.text() == "-"
        @hash.store("tenkiId" + i.to_s,-10)
      else
        @hash.store("tenkiId" + i.to_s,3)
      end
      @todayArray.push(@hash)
    end

    # 明日の天気（@niftu天気予報）
    item_nodes = doc.css('//div[@id="tomorrowWeather"]/div/table tr:nth-child(2) td/img/@alt').each_with_index do |node,i|
      @hash = {}
      @hash.store("tenki" + i.to_s,node.text())
      if node.text() == "晴れ"
        @hash.store("tenkiId" + i.to_s,1)
        v=1
      elsif node.text() == "曇り" || node.text() == "くもり"
        @hash.store("tenkiId" + i.to_s,2)
      elsif node.text() == "-"
        @hash.store("tenkiId" + i.to_s,-10)
      else
        @hash.store("tenkiId" + i.to_s,3)
      end
      @tomorrowArray.push(@hash)
    end
    
    # 今日の天気（yahoo天気）
    url = 'https://weather.yahoo.co.jp/weather/jp/'+params[:prefecture_id]+'/'+ctiyId+'/'+params[:ward_id]+'.html'
    # 'https://weather.yahoo.co.jp/weather/jp/14/4610/14133.html'
    doc = Nokogiri::HTML(open(url))
    doc.xpath('//div[@id="yjw_pinpoint_today"]/table[@class="yjw_table2"]/tr/td/img/@alt').each_with_index do |node,i|
      @hash=@todayArray[i]
      a=@hash["tenkiId" + i.to_s]
      if node.text() == "晴れ"
        @hash.store("tenkiId" + i.to_s,a+1)
      elsif node.text() == "曇り" || node.text() == "くもり"
        @hash.store("tenkiId" + i.to_s,a+2)
      else
        @hash.store("tenkiId" + i.to_s,a+3)
      end
    end
    
    
    # 明日の天気（yahoo天気）
    doc.xpath('//div[@id="yjw_pinpoint_tomorrow"]/table[@class="yjw_table2"]/tr/td/img/@alt').each_with_index do |node,i|
      @hash=@tomorrowArray[i]
      a = @hash["tenkiId" + i.to_s]
      if node.text() == "晴れ"
        @hash.store("tenkiId" + i.to_s,a+1)
        v=1
      elsif node.text() == "曇り" || node.text() == "くもり"
        @hash.store("tenkiId" + i.to_s,a+2)
      else
        @hash.store("tenkiId" + i.to_s,a+3)
      end
    end
    
    # 今日の天気（日本気象庁）
    prefectureIdKishoutyou = params[:prefecture_id].to_i + 3
    url = 'https://tenki.jp/forecast/3/' + prefectureIdKishoutyou.to_s + '/' + ctiyId + '/' + params[:ward_id] + '/3hours.html'
    # 'https://tenki.jp/forecast/3/17/4610/14133/3hours.html'
    doc = Nokogiri::HTML(open(url))
    item_nodes = doc.xpath('//table[@id="forecast-point-3h-today"]/tr[@class="weather"]/td').each_with_index do |node,i|
      i+=1
      @hash=@todayArray[i]
      a=@hash["tenkiId" + i.to_s]
      if node.text() == "晴れ"
        @hash.store("tenkiId" + i.to_s,a+1)
      elsif node.text() == "曇り" || node.text() == "くもり"
        @hash.store("tenkiId" + i.to_s,a+2)
      else
        @hash.store("tenkiId" + i.to_s,a+3)
      end
    end
    
    # 明日の天気（日本気象庁）
    item_nodes = doc.xpath('//table[@id="forecast-point-3h-tomorrow"]/tr[@class="weather"]/td').each_with_index do |node,i|
      i+=1
      @hash=@tomorrowArray[i]
      a=@hash["tenkiId" + i.to_s]
      if node.text() == "晴れ"
        @hash.store("tenkiId" + i.to_s,a+1)
      elsif node.text() == "曇り" || node.text() == "くもり"
        @hash.store("tenkiId" + i.to_s,a+2)
      else
        @hash.store("tenkiId" + i.to_s,a+3)
      end
    end
    
    @todayArray.each_with_index do |var,i|
      a=0
      if i == 0
        a=var["tenkiId" + i.to_s]/2
        var["tenkiId" + i.to_s]=a
      elsif i == 8
        a=var["tenkiId" + i.to_s]/2
        var["tenkiId" + i.to_s]=a
      else
        a=var["tenkiId" + i.to_s]/3
        var["tenkiId" + i.to_s]=a
      end
    end
    
    @tomorrowArray.each_with_index do |var,i|
      a=0
      if i == 0
        a=var["tenkiId" + i.to_s]/2
        var["tenkiId" + i.to_s]=a
      elsif i == 8
        a=var["tenkiId" + i.to_s]/2
        var["tenkiId" + i.to_s]=a
      else
        a=var["tenkiId" + i.to_s]/3
        var["tenkiId" + i.to_s]=a
      end
    end

  end
end 