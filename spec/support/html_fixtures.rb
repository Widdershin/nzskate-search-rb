require 'nokogiri'

module HTMLFixtures
  def load_html_snippet(name)
    html = File.read("#{Rails.root}/fixtures/html_snippets/#{name}.html")
    Nokogiri::HTML(html)
  end
end