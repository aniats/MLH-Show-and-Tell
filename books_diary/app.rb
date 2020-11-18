# frozen_string_literal: true

require 'roda'
require_relative 'models'

# The core class of the web application for managing your books
class App < Roda
  opts[:root] = __dir__
  plugin :environments
  plugin :render

  configure :development do
    plugin :public
    opts[:serve_static] = true
  end

  opts[:books] = BookList.new([
                                    Book.new('Atlas Shrugged', 'Ayn Rand', '2020-05-01'),
                                    Book.new('The Hitchhikers Guide to the Galaxy', 'Douglas Adams', '2020-01-01'),
                                    Book.new('The Financier', 'Theodore Dreiser', '2019-12-31'),
                                    Book.new('Innovators', 'Walter Isaacson', '2018-08-22'),
                                    Book.new('Bad Blood', 'John Carreiro', '2018-03-26'),
                                    Book.new('Way Station', 'Clifford Simak', '2018-01-01'),
                                    Book.new('The Goblin Reservation', 'Clifford Simak', '2018-11-27'),
                                    Book.new('The Help', 'Kathryn Stockett', '2019-04-03'),
                                    Book.new('Горе от ума (Woe from Wit)', 'Александр Грибоедов (Alexander Griboedov)', '2019-02-13')
                              ])

  route do |r|
    r.public if opts[:serve_static]

    r.root do
      view('main')
    end

    r.on 'main' do
      view('main')
    end

    r.on 'books' do
      @filtered_books = opts[:books].all_books
      view('books')
    end

    r.on 'new' do
      r.get do
        view('new_book')
      end

      r.post do
        @params = InputValidators.check_book(r.params['name'], r.params['author'], r.params['date'])
        if @params[:errors].empty?
          opts[:books].add_book(Book.new(@params[:name], @params[:author], @params[:date]))
          r.redirect '/books'
        else
          view('new_book')
        end
      end
    end

    r.on 'filter' do
      r.is do
        @params = InputValidators.check_year(r.params['year'])
        @filtered_books = if @params[:errors].empty? && r.params['year']
                            opts[:books].filter(@params[:year])
                          else
                            opts[:books].statistics_for_all_years
                          end
        @month = %w[January February March April May June July July August September October November December]
        view('filter')
      end
    end
  end
end
