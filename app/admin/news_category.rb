ActiveAdmin.register NewsCategory do
  # before_filter :skip_sidebar!
  permit_params :name, :description
  menu parent: "最新消息", label: "消息種類"

  form do |f|
    f.inputs "消息種類" do
      f.input :name, label: '種類名稱'
      f.input :description, label: '種類描述'
    end
    f.actions
  end

  index title: '消息種類' do
    selectable_column
    id_column
    column ('種類名稱') { |news| news.name }
    column ('種類描述') { |news| news.description}
    actions
  end

  show do 
    attributes_table do 
      row :id
      row ('種類名稱') { |news| news.name }
      row ('種類描述') { |news| news.description}
    end
  end
end
