class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :membership_sum
 


  def membership_sum
    self.object.memberships.sum(:charge)
  end

 
end
