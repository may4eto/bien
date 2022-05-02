ActiveAdmin.register Page do
permit_params :title, :body, :url, :image
index do 
  index_column
  column :title
  column :url
  actions
  end
end
