class Amigo < ActiveRecord::Base
  belongs_to :caroneiro
  belongs_to :amigo, :class_name => "Caroneiro", :foreign_key => "amigo_id"
end
