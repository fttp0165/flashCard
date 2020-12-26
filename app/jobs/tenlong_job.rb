class TenlongJob < ApplicationJob
  queue_as :default

  def perform(user)
    require 'open-uri'
    result = Nokogiri::HTML(URI.open('https://www.tenlong.com.tw/zh_tw/recent_bestselling?range=7'))
    top10=result.css('.single-book .title a').first(10)
    top10.each.with_index do |book,idx|
      user.cards.find_or_create_by(content: book.text) do |b|
        b.title = "top #{idx + 1}"
      end
    end
  end
end
