class Round < ActiveRecord::Base
  belongs_to :fight
  belongs_to :attacker, class_name: 'Fighter'
  belongs_to :defenser, class_name: 'Fighter'
end
