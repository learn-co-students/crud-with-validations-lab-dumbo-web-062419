class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true

  with_options if: :released? do |song|
    song.validates :release_year, presence: true, if: :released?
    song.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
  end



  def released?
    self.released == true
  end

  # def valid_date
  #   if self.release_year < Time.now
  #     false
  #   else
  #     true
  #   end
  # end

end
