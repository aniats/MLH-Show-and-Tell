# frozen_string_literal: true

# Validators for the incoming requests
module InputValidators
  def self.check_year(raw_year)
    year = raw_year || ''
    errors = []
    if year != ''
      errors.concat(['Year must be in YYYYY format']) if year.size != 4
      errors.concat(['Only numbers are acceptable']) unless /\d{4}/ =~ year
    end
    {
      year: year,
      errors: errors
    }
  end

  def self.check_date_format(date)
    errors = []
    if /\d{4}-\d{2}-\d{2}/ =~ date
      errors.concat(['Month should be in the range: 1...12']) if date[5..6].to_i > 12
      errors.concat(['In a month no more than 31 days']) if date[8..9].to_i > 31
      errors
    else
      ['Date should in YYYYY-MM-DD format']
    end
  end

  def self.check_book(raw_name, raw_author, raw_date)
    name = raw_name || ''
    author = raw_author || ''
    date = raw_date || ''
    errors = [].concat(check_name(name))
               .concat(check_author(author))
               .concat(check_date(date))
               .concat(check_date_format(date))
    {
      name: name,
      author: author,
      date: date,
      errors: errors
    }
  end

  def self.check_name(name)
    if name.empty?
      ['The title of the book cannot be empty']
    else
      []
    end
  end

  def self.check_author(author)
    if author.empty?
      ['Authors name cannot be empty']
    else
      []
    end
  end

  def self.check_date(date)
    if date.empty?
      ['Date cant be empty']
    else
      []
    end
  end
end
