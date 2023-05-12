require 'rcv_deeplink/reference'

class RcvDeeplink

  URL = "https://text.recoveryversion.bible/"

  def self.url(book_number, chapter_number, verse_number=1)
    self.new(book_number, chapter_number, verse_number).url
  end

  def self.path(book_number, chapter_number, verse_number=1)
    self.new(book_number, chapter_number, verse_number).path
  end

  def initialize(book_number, chapter_number, verse_number)
    @book_number = book_number
    @chapter_number = chapter_number
    @verse_number = verse_number
  end

  def path
    "#{padded_book_number}_#{book_name_no_spaces}_#{@chapter_number}.htm\##{anchor_tag_book_abbreviation}#{@chapter_number}#{verse_anchor}"
  end

  def url
    URL + path
  end

  private

  def padded_book_number
    sprintf("%02d", @book_number.to_i)
  end
  
  def mapping
    @mapping ||= Reference::MAPPING
  end

  def row
    @row ||= mapping[@book_number.to_i - 1]
  end

  def book_name_no_spaces
    row[:book_name].gsub(/\s/, '')
  end

  def anchor_tag_book_abbreviation
    row[:ref_code]
  end

  def verse_anchor
    "-#{@verse_number}" if @verse_number.to_i > 0
  end


  # https://text.recoveryversion.bible/13_1Chronicles_1.htm#FCh1-19
# <prefix>/<bknum>_<bkname>_<chp>.htm#<bkrefcd><chp>-<verse>

# prefix: https://text.recoveryversion.bible/
# bknum: Bible book order number (i.e. 01 for Genesis, 40 for Matthew, and 66 for Revelation)
# bkname: Bible book name (i.e. Genesis, Exodus, Matthew, etc.)
# bkrefcd: 3 letter Bible Book reference code (i.e. Gen for Genesis, Fki for 1 Kings; See recver ref code list)
# chp: chapter number
# verse: verse number
end
