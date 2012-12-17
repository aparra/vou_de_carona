class AssinanteNewsletter < ActiveRecord::Base
  attr_accessible :email
  
  validates_presence_of :email, :message => "deve ser preenchido"
end
