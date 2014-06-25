require 'nokogiri'
require 'open-uri'

module PageLoader
  def self.load_page(url)
    Nokogiri::HTML open(url)
  end
end