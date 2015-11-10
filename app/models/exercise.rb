class Exercise < ActiveRecord::Base
  belongs_to :user

  validates :bench,
    :deadlift,
    :squat,
    :overhead_press,
    :barbell_row,
    :tricep_extension,
    :barbell_curl,
    :cable_crunches,
    :calf_raise,
    :pullups,
    :bench_reps,
    :deadlift_reps,
    :squat_reps,
    :overhead_press_reps,
    :barbell_row_reps,
    :tricep_extension_reps,
    :barbell_curl_reps,
    :cable_crunches_reps,
    :calf_raise_reps,
    :pullup_reps,
    numericality: { greater_than_or_equal_to: 0 }

end
