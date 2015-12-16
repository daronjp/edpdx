class Photo < ActiveRecord::Base
  belongs_to :product

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    # square: '200x200#',
    medium: '300x300>',
    large: '400',
    xlarge: '800'
  },
  :storage => :s3,
  :s3_credentials => "#{Rails.root}/config/s3.yml",
  # :path => ":attachment/:id/:style.:extension",
  # :path => '/:class/:attachment/:id_partition/:style/:filename',
  :bucket => 'edpdx'

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
