class Weight < ApplicationRecord
  belongs_to :end_user

  def self.chart_date
    order(recorded_at: :desc).pluck('recorded_at', 'value').to_h
  end

end
