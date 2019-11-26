Rails.application.routes.draw do
  resources :mytests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :configs
  resources :logins
  resources :api do
    collection do
      get 'before_create_project' #创建项目前置
      post 'create_project' #创建项目
      get 'get_ower' #获取我的信息页
      get 'get_project_list' #获取项目列表
      get 'before_create_order' #创建订单前置
      post 'create_order' #创建订单
      get 'get_order_list' #获取订单列表
      get 'new_project' #创建项目前置
      get 'edit_project' #编辑项目前置
      post 'create_notice' #创建公告
      get 'get_notice_list' #获取公告列表
      get 'show_notice' #显示公告内容
      post 'update_notice' #更新公告内容
      delete 'delete_notice' #删除公告
      get 'get_contact' #获取联系人列表
      post 'create_contact' #创建联系人
    end
  end
  resources :questionstatus
  resources :questions
  resources :questionpris
end
