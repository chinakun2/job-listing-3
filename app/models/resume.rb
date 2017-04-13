class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :exam

  mount_uploader :attachment, AttachmentUploader

  validates :content, presence: true
end
