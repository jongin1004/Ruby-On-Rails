class Video < ApplicationRecord
  mount_uploader :file, FileUploader
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments

  def self.search(search)
    if search != nil
      @videos = Video.where("title like ?", "%#{search}%")
    else
      @videos = Video.all
    end
  end

end