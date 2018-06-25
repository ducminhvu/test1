class Seed < ApplicationRecord
  attr_accessor :label_prefix

  has_one :fruit

  before_create :generate_label

  scope :by_app_id, ->(app_id) do
    where(app_id: app_id).limit(10)
  end
  scope :not_consumed_by_app_id, ->(app_id) do
    where(app_id: app_id, is_consumed: false).order("RANDOM()").limit(1)
  end

  private
  def generate_label
    self.label = if label_prefix.present?
      [label_prefix, "-", SecureRandom.hex].join
    else
      SecureRandom.hex
    end
  end
end
