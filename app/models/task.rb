class Task < ActiveRecord::Base
    validates :unique_id, uniqueness: true

end