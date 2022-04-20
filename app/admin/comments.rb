ActiveAdmin.register Comment, :as => "UserComment" do
  permit_params :body, :review_id, :user_id
  index do 
    selectable_column
    index_column
    column :body
    column :review
    column :user
    column :created_at
    actions
  end
end
