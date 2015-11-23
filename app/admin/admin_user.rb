ActiveAdmin.register AdminUser do
  # before_filter :skip_sidebar!
  permit_params :email, :password, :password_confirmation
  menu parent: "使用者管理", label: "管理者帳號"

  index title: '管理員' do
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

  show do 
    attributes_table do 
      row :id
      row :email
      row ('最近登入時間') { |user| user.current_sign_in_at }
      row ('登入次數') { |user| user.sign_in_count}
      row ('最近登入IP') { |user| user.current_sign_in_ip }
      row ('註冊日期') { |user| user.created_at}
    end
  end

  form do |f|
    f.inputs "管理者明細" do
      f.input :email
      f.input :password, label: '密碼'
      f.input :password_confirmation, label: '再輸入一次密碼'
    end
    f.actions
  end

end
