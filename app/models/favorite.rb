class Favorite < ApplicationRecord
  validates:user_id,presence:true,uniquness:{scope:book_id}
  belongs_to:user
  belongs_to:book
end
