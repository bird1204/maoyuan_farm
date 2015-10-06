ActiveAdmin.register New do
  # before_filter :skip_sidebar!
  permit_params :title, :content, :category
  menu label: '最新消息'

  form do |f|
    f.inputs "最新消息" do
      f.input :title, label: '標題'
      f.input :content, label: '內容'
      f.input :category, as: :radio, collection: ['站務公告', '營業訊息', '特價資訊', '新品上市', '後台測試'], label: '新聞種類'
    end
    f.actions
  end

  index title: '最新消息' do
    selectable_column
    id_column
    column ('標題') { |news| news.title }
    column ('新聞種類') { |news| news.category}
    column ('內容') { |news| news.content}
    column ('建立日期') { |news| news.created_at}
    column ('更新日期') { |news| news.updated_at}
    actions
  end

  show do 
    attributes_table do 
      row :id
      row ('標題') { |news| news.title }
      row ('新聞種類') { |news| news.category}
      row ('內容') { |news| news.content}
      row ('建立日期') { |news| news.created_at}
      row ('更新日期') { |news| news.updated_at}
    end
  end
end
