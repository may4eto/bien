ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :username, :email, :password_digest, :real_name, :is_admin
  index do 
    selectable_column
    index_column
    column :username
    column :email
    column :real_name
    column :created_at
    column :is_admin
    actions
  end
  controller do 
    resources_configuration[:self][:finder] = :find_by_username
  end
end
