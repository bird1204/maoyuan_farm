ActiveAdmin.register PaymentMethod do
  # before_filter :skip_sidebar!
  permit_params :name
  menu parent: "訂單管理", label: '付款方式'

  form do |f|
    f.inputs "付款方式" do
      f.input :name, label: '名稱'
    end
    f.actions
  end


  index do
    selectable_column
    id_column
    column ('名稱') { |method| method.name }
    column ('建立日期') { |method| method.created_at}
    column ('更新日期') { |method| method.updated_at}
    actions
  end

  show do 
    attributes_table do 
      row :id
      row ('名稱') { |method| method.name }
      row ('建立日期') { |method| method.created_at}
      row ('更新日期') { |method| method.updated_at}
    end
  end
end
