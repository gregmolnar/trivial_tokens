class Article < ActiveRecord::Base
  belongs_to :author
  has_and_belongs_to_many :tags
  tokenize :tags
end

