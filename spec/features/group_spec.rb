require 'rails_helper'
has_one_attached :image
validates :width, presence: true, if: ->(item) { !item.image.attached?}
end
it 'is valid if image is attached' do
file = Rails.root.join('spec', 'support', 'assets', 'shipment_item', 'wine-box.jpeg')
image = ActiveStorage::Blob.create_after_upload!(
io: File.open(file, 'rb'),
filename: 'wine-box.jpeg',
content_type: 'image/jpeg' # Or figure it out from `name` if you have non-JPEGs
).signed_id
shipment_item = ShipmentItem.new(image: image)
expect(shipment_item.valid?).to eq true
end