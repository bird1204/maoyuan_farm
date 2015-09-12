ActiveAdmin.register New do
  # before_filter :skip_sidebar!
  permit_params :title, :content, :category

  form do |f|
    f.inputs "New" do
      f.input :title, label: '標題'
      f.input :content, label: '內容'
      f.input :category, as: :radio, collection: ['站務公告', '營業訊息', '特價資訊', '新品上市', '後台測試'], label: '新聞種類'
    end
    f.actions
  end
end
