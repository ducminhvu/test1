class Seed < ApplicationRecord
  attr_accessor :label_prefix

  before_create :generate_label

  private
  def generate_label
    self.label = if label_prefix.present?
      [label_prefix, "-", SecureRandom.hex].join
    else
      SecureRandom.hex
    end
  end
end
