ActiveAdmin.register Category do
  # before_filter :skip_sidebar!
  permit_params :name, :description
  menu parent: "product megt."

end
