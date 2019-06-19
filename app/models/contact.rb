class Contact < ApplicationRecord
    #Validations
    validates_presence_of :kind
    #validates_presence_of :address
    
    #Associations
    belongs_to :kind #,optional: true
    has_many :phones
    has_one :address

    accepts_nested_attributes_for :phones, allow_destroy: true
    accepts_nested_attributes_for :address, update_only: true

    #def to_br
    #    {
    #     id: self.id,
    #     name: self.name, 
    #     birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?),
    #     kind: self.kind_id
    #    }
    #end

    def as_json(options={})
        h = super(options)
        h[:birthdate] = I18n.l(self.birthdate) unless self.birthdate.blank?
        h
    end

    
end
