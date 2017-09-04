module Orderable
  extend ActiveSupport::Concern
  def in_order
    order(created_at: :asc)
  end

  def get_neighbors
    [{name: 'next', operator: ">"}, {name: 'previous', operator: "<"}].each do | op |
      define_singleton_method (op[:name]) do |position|
        self.class.where("id #{op[:operator]} ?", self.id).send(position)
      end
    end
  end

  def recent(n)
    in_order.endmost(n)
  end

  def endmost(n)
    #TODO update so other types of artifacts can be used
    all.only(:order).from(all.reverse_order.limit(n), Article)
  end
end
