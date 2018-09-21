class Item < ActiveRecord::Base
	validates :price, numericality: { greater_than: 0, allow_nil: true }
	validates :name, :description, presence: true

	belongs_to :category

	after_initialize {  } # Item.new; Item.first
	after_save       {  } # Item.save; Item.create; Item.update_attributes()
	after_create     { category.inc(:item_count, 1) }
	after_update     {  }
	after_destroy    { category.inc(:item_count, -1) } # item.destroy
end
