class Fruit < ApplicationRecord
  attr_accessor :name_prefix

  belongs_to :seed, optional: true

  before_create :generate_name

  private
  def generate_name
    self.name = if name_prefix.present?
      [name_prefix, "-", SecureRandom.hex].join
    else
      SecureRandom.hex
    end
  end
end
