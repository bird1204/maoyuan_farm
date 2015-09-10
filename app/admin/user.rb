ActiveAdmin.register User do
  # before_filter :skip_sidebar!
  permit_params :email, :password, :password_confirmation
  menu parent: "User megt."
  index do
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

end
