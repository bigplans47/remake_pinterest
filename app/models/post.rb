class Post < ActiveRecord::Base
  belongs_to :collection
  validates :caption, :location, :presence => true
end
