ActiveAdmin.register Category do
  # before_filter :skip_sidebar!
  permit_params :name, :description
  menu parent: "商品管理", label: "商品種類"

  index title: '商品種類' do 
    selectable_column
    id_column
    column ('名稱') { |product| product.name}
    column ('說明') { |product| product.description}
    column ('建立日期') { |product| product.created_at}
    column ('更新日期') { |product| product.updated_at}
    actions
  end

  show do 
    attributes_table do 
      row :id
      row ('名稱') { |product| product.name}
      row ('說明') { |product| product.description}
      row ('建立日期') { |product| product.created_at}
      row ('更新日期') { |product| product.updated_at}
    end
  end

  form do |f|
    f.inputs "商品種類" do
      f.input :name, label: '名稱'
      f.input :description, label: '說明'
    end
    f.actions
  end

end
