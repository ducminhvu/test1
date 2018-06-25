class Fruit < ApplicationRecord
  attr_accessor :name_prefix

  belongs_to :seed, optional: true

  before_create :generate_name
  after_save :update_seed

  private
  def generate_name
    self.name = if name_prefix.present?
      [name_prefix, "-", SecureRandom.hex].join
    else
      SecureRandom.hex
    end
  end

  def update_seed
    return unless seed
    seed.update_attributes is_consumed: true
  end
end
