class LocalIndex < ActiveRecord::Base
  belongs_to :violence,
    foreign_key: "violence_id"
end
