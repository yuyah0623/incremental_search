class Scraping
  def self.get_books
    agent = Mechanize.new
    books = []
    i = 1
    while i < 5
      page = agent.get("http://www.cmoa.jp/ranking/genre/?page=#{i}&id=20")
      links = page.search(".title_name a")
      links.each do |link|
        books << link[:href]
      end
      i += 1
    end
    books.each do |book|
      get_book(book)
    end
  end


  def self.get_book(link)
    agent = Mechanize.new
    page = agent.get(link)
    name = page.at(".title_details_title_name").inner_text if page.at(".title_details_title_name")
    image = page.at(".title_big_thum")[:src] if page.at(".title_details_thum_box")
    image = "http://www.cmoa.jp" + image
    book = Book.where(title: name.strip, image: image).first_or_initialize
    book.save
  end
end