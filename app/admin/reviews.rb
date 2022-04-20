ActiveAdmin.register Review do
  permit_params :title, :body, :score, :restaurant, :price, :cuisine, :phone_number, :ambiance, :latitude, :longitude, :address, :user_id, :photo, :is_featured
  index do 
    selectable_column
    index_column
    column "Image" do |review|
      image_tag review.photo.url, width: "50" unless review.photo.url.nil?
    end
    column :title
    column :score
    column :price
    column :cuisine
    column :created_at
    column :is_featured
    actions
  end
end
