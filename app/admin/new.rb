ActiveAdmin.register New do
  # before_filter :skip_sidebar!
  permit_params :title, :content, :news_category_id
  menu parent: "最新消息", label: "最新消息"


  form do |f|
    f.inputs "最新消息" do
      f.input :title, label: '標題'
      f.input :content, label: '內容'

      f.input :news_category_id, label: '新聞種類', as: :radio, collection: NewsCategory.all.collect { |c| [c.name, c.id]}

    end
    f.actions
  end

  index title: '最新消息' do
    selectable_column
    id_column
    column ('標題') { |news| news.title }
    column ('新聞種類') { |news| news.news_category.name}
    column ('內容') { |news| news.content}
    column ('建立日期') { |news| news.created_at}
    column ('更新日期') { |news| news.updated_at}
    actions
  end

  show do 
    attributes_table do 
      row :id
      row ('標題') { |news| news.title }
      row ('新聞種類') { |news| news.news_category.name}
      row ('內容') { |news| news.content}
      row ('建立日期') { |news| news.created_at}
      row ('更新日期') { |news| news.updated_at}
    end
  end
end
