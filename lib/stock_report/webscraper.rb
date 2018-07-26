class StockReport::WebScraper
  attr_accessor :url, :doc
  def initialize(url)
    @url = url
    @doc = Nokogiri::HTML(open(self.url))
  end

  def price_lookup
    price = self.doc.css("div.qwidget-dollar").text
    price = price.delete!("*")
    return price
  end

  def most_active
    self.doc.css("[id = two_column_main_content_MostActiveByShareVolume_tickerwidget_MostActiveByShareVolume_0_summaryquotes_0]").each do |stock|
      puts symbol
    end
  end
end
