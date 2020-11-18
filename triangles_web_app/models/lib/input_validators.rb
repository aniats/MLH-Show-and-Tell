# frozen_string_literal: true

# blah-blah
module InputValidators
  def self.check_side(raw_side)
    side = raw_side || ''
    errors = []
    return errors.concat(['Empty string']) if side == ''

    if side.to_f <= 0
      errors.concat(['Side of triangle has to be a positive number'])
    end
    {
      side: side.to_f,
      errors: errors
    }
  end

  def self.check_sides_length(raw_side1, raw_side2, raw_side3)
    side1 = check_side(raw_side1)
    side2 = check_side(raw_side2)
    side3 = check_side(raw_side3)
    errors = []
    if side1[:errors].empty? && side2[:errors].empty? && side3[:errors].empty?
      side1 = side1[:side]
      side2 = side2[:side]
      side3 = side3[:side]
      if side1 + side2 > side3 &&
         side2 + side3 > side1 &&
         side1 + side3 > side2
      else
        errors.concat(['Triangles inequality is not performed'])
      end
    else
      errors = errors.concat(side1[:errors]).concat(side2[:errors]).concat(side3[:errors])
      side1 = side1[:side]
      side2 = side2[:side]
      side3 = side3[:side]
    end
    {
      errors: errors,
      first: side1,
      second: side2,
      third: side3
    }
  end

  def self.check_min_and_max(raw_min, raw_max)
    min = raw_min || ''
    max = raw_max || ''
    errors = []
    if min == '' && max != ''
      errors.concat(['No minimum area specified'])
    elsif min != '' && max == ''
      errors.concat(['Maximum area is not specified'])
    else
      if min.to_f.negative? || max.to_f.negative?
        errors.concat(['The area cannot be negative'])
      end
      if min.to_f > max.to_f
        errors.concat(['Minimum area is larger than maximum'])
      end
    end
    {
      errors: errors,
      min: min,
      max: max
    }
  end
end
