ActiveAdmin.register Product do
  # before_filter :skip_sidebar!
  permit_params :name, :description, :price, :stock, :comment, :category_id, :avatar, images_attributes: [:id, :avatar, :product_id]
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
    link_to image_tag(product.icon_url), admin_product_path(product)
  end

  show do
    attributes_table do
      row :name
      row :category_id do |product|
        product.category.name
      end
      row :description
      row :stock
      row :comment
      row '顯示圖' do |product|
        image_tag(product.icon_url)
      end

      table_for product.images do
        column('產品圖') { |im| image_tag(im.image_url) }
      end

    end
  end

  form(html: { multipart: true }) do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :category_id, as: :radio, collection: Category.all.collect { |c| [c.name, c.id]}
      f.input :description
      f.input :price, as: :number, :in => 1..10
      f.input :stock, as: :number, :in => 1..10
      f.input :comment
      f.inputs '顯示圖' do 
        f.input :avatar, as: :file, hint: image_tag(f.object.icon_url)
        f.input :avatar_cache, as: :hidden 
      end
      f.has_many :images do |ff|
        ff.input :avatar, as: :file, hint: image_tag(ff.object.image_url)
        ff.input :avatar_cache, as: :hidden 
      end
    end
    f.actions
  end 

end
