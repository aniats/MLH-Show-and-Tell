# frozen_string_literal: true

require 'forwardable'

# List with all your books stored
class BookList
  extend Forwardable
  def_delegator :@books, :each, :each_book

  def initialize(books = [])
    @books = books
    sort_by_date
  end

  def add_book(book)
    @books.append(book)
    sort_by_date
  end

  def all_books
    sort_by_date
    @books.dup
  end

  def sort_by_date
    @books = @books.sort_by { |book| Date.strptime(book.date, '%Y-%m-%d') }.reverse
  end

  def statistics_for_all_years
    years = {}
    @books.each do |book|
      year = book.date[0..3]
      res = filter(year)
      years[year] = res[year]
    end
    years
  end

  def find_year(year)
    @books.each do |book|
      return true if book.date[0..3] == year
    end
    false
  end

  def filter(year)
    if find_year(year)
      year = year.to_i
      months = Array.new(12, 0)
      # Counting books for each month
      @books.each do |book|
        months[book.date[5..6].to_i - 1] += 1 if book.date[0..3].to_i == year
      end
      # Creating hash Hash['year'] = array with months
      res = Hash.new(0)
      res[year.to_s] = months
      return res
    end
    []
  end
end
