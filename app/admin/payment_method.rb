ActiveAdmin.register PaymentMethod do
  # before_filter :skip_sidebar!
  permit_params :name
  menu parent: "Order megt."
end
