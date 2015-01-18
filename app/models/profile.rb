class Profile
  include Mongoid::Document
  include Mongoid::Timestamps

  ORIENTATIONS = %W(male female both)
  AGE_RANGES = {
    '10 - 14' => {min:10, max:14},
    '15 - 21' => {min:15, max:21},
    '22 - 29' => {min:22, max:29},
    '30 - 40' => {min:30, max:40},
    '41 - 70' => {min:41, max:70},
    '71 - 120' => {min:71, max:120}
  }

  field :user_id,         type: String
  field :orientation,     type: String
  field :age_range,       type: String, default: 0

  validates :orientation, inclusion: { in: ORIENTATIONS,
    message: "%{value} is not a valid orientation" }

  validates :age_range, inclusion: { in: AGE_RANGES.keys,
    message: "%{value} is not a valid age range" }

  belongs_to :user

  def age_range_delta
    AGE_RANGES[self.age_range]
  end

  def get_correct_age_range age
    result = nil
    AGE_RANGES.each do |key, value|
      if age.between?(value[:min], value[:max])
        result = key
      end
    end
    result
  end

end
