require 'rubygems'
require 'nokogiri'
require 'open-uri'



page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))   


#puts page.text   # => Nokogiri::HTML::Document


symbol = []
page.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--hide-sm cmc-table__cell--sort-by__symbol"]').each do |node|
  symbol << node.text

#puts symbol

price = []
page.xpath('//td [@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]').each do |node|
  price << node.text
end
#puts price

tableau3 = Hash[symbol.zip (price)].to_a

puts tableau3


#print hash
end



  #<td class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--hide-sm cmc-table__cell--sort-by__symbol"><div class="">BTC</div></td>