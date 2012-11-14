class Url < ActiveRecord::Base
  attr_accessible :original_url, :short_url
  
  belongs_to :user
  
  # validates :original_url, :presence => true, :uniqueness => true, :format => {:with => /^(http:\/\/|https:\/\/)/}
  # validates :short_url, :presence => true, :uniqueness => true
end
