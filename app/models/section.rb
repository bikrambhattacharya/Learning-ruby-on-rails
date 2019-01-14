class Section < ApplicationRecord
    
    scope :sorted, lambda { order("position ASC")}
    belongs_to :page, :required => false
    has_many :section_edits
    has_many :admin_users, :through => :section_edits

    validates_presence_of :name
end
