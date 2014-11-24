class Violence < ActiveRecord::Base
  has_many :local_indices, foreign_key: "violence_id"
end
