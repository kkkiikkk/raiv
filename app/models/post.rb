class   Post < ApplicationRecord
  extend Mobility
  extend FriendlyId

  translates :title, type: :string
  translates :description, type: :text

  friendly_id :title, use: :slugged

  has_and_belongs_to_many :categories

  has_one_attached :cover_image
  has_one_attached :video
  has_many_attached :screenshots

  validates :title, presence: true
  validates :description, presence: true

  validate :video_format_validation

  scope :newest, -> {
    order(published_year: :desc)
  }

  scope :oldest, -> {
    order(published_year: :asc)
  }

  scope :filter_by_year, ->(year) {
    where(published_year: year)
  }

  private

  def video_format_validation
    return unless video.attached?

    if video.blob.content_type != 'video/mp4'
      errors.add(:video, 'must be an MP4 file')
    end
  end
end
