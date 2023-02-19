class Weapon < ActiveRecord::Base
  STATS_RANGES = {
    attack: 0..2,
    defense: 0..2,
  }.freeze

  mount_uploader :avatar, AvatarUploader
end
