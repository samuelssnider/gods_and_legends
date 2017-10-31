class Birth < ApplicationRecord
  belongs_to :parent, foreign_key: "parent_id", class_name: "Deity"
  belongs_to :child, foreign_key: "child_id", class_name: "Deity"
end
