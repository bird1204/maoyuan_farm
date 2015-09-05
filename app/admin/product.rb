ActiveAdmin.register Product do
  # before_filter :skip_sidebar!
  permit_params :name, :description, :price, :stock, :comment, :category_id, :avatar
  includes :category
  
  menu parent: "product megt."
  index do 
    selectable_column
    id_column
    column :name
    column :category_id do |product|
      product.category.name
    end
    column :description
    column :stock
    column :comment
    column :updated_at
    actions
  end

  index  as: :grid do |product|
    link_to image_tag('1700866_L.jpg'), admin_product_path(product)
  end

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :category_id, as: :radio, collection: Category.all.collect { |c| [c.name, c.id]}
      f.input :description
      f.input :price, as: :number, :in => 1..10
      f.input :stock, as: :number, :in => 1..10
      f.input :comment
      f.input :avatar
    end
    f.actions
  end 

end
