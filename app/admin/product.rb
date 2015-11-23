ActiveAdmin.register Product do
  # before_filter :skip_sidebar!
  permit_params :name, :description, :price, :stock, :comment, :category_id, :avatar, images_attributes: [:id, :avatar, :product_id]
  includes :category
  
  menu parent: "商品管理", label: "商品"

  index title: '商品' do 
    selectable_column
    id_column
    column ('名稱') { |product| product.name}
    column ('種類') { |product| product.category.name}
    column ('說明') { |product| product.description}
    column ('價格') { |product| product.price}
    column ('庫存數量') { |product| product.stock}
    column ('備註') { |product| product.comment}
    column ('更新日期') { |product| product.updated_at}
    actions
  end

  index title: '商品', as: :grid do |product|
    link_to image_tag(product.icon_url), admin_product_path(product)
  end

  show do
    attributes_table do
      row ('名稱') { |product| product.name}
      row ('種類') { |product| product.category.name}
      row ('說明') { |product| product.description}
      row ('價格') { |product| product.price}
      row ('庫存數量') { |product| product.stock}
      row ('備註') { |product| product.comment}
      row '顯示圖' do |product|
        image_tag(product.icon_url)
      end

      table_for product.images do
        column('產品圖') { |im| image_tag(im.image_url) }
      end

    end
  end

  form(html: { multipart: true }) do |f|
    f.inputs "商品" do
      f.input :name, label: '名稱'
      f.input :category_id, label: '種類', as: :radio, collection: Category.all.collect { |c| [c.name, c.id]}
      f.input :description, label: '說明'
      f.input :price, as: :number, :in => 1..10, label: '價格'
      f.input :stock, as: :number, :in => 1..10, label: '庫存'
      f.input :comment, label: '備註'
      f.inputs '顯示圖' do 
        f.input :avatar, as: :file, hint: image_tag(f.object.icon_url), label: '顯示圖'
        f.input :avatar_cache, as: :hidden
      end
      f.has_many :images, label: '產品圖' do |ff|
        ff.input :avatar, as: :file, hint: image_tag(ff.object.image_url), label: '產品圖'
        ff.input :avatar_cache, as: :hidden
      end
    end
    f.actions
  end 

end
