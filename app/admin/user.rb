ActiveAdmin.register User do
  # before_filter :skip_sidebar!
  permit_params :email, :password, :password_confirmation
  menu parent: "使用者管理", label: "會員帳號"
  index title: '會員' do
    selectable_column
    id_column
    column :email
    column ('最近登入時間') { |user| user.current_sign_in_at}
    column ('登入次數') { |user| user.sign_in_count}
    column ('註冊日期') { |user| user.created_at}
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "會員明細" do
      f.input :email
      f.input :password, label: '密碼'
      f.input :password_confirmation, label: '再輸入一次密碼'
    end
    f.actions
  end

  show do 
    attributes_table do 
      row :id
      row ('email') { |user| user.email}
      row ('地址') { |user| user.address}
      row ('電話') { |user| user.phone}
      row ('登入次數') { |user| user.sign_in_count}
      row ('最近登入時間') { |user| user.current_sign_in_at}
      row ('註冊日期') { |user| user.created_at}
    end
  end

end
