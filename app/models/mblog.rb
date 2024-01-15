class Mblog < ApplicationRecord
  belongs_to :owner

  has_many_attached :photos

  
  
end
