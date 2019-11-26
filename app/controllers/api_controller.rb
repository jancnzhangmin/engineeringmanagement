class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def get_project_list
    status = 200
    msg = 'OK'
    user = User.find_by_token(request.headers[:UserToken].to_s)
    if user
      collaborates = user.collaborates.page(params[:page]).per(10).order('id desc')
      projects = Project.where('id in (?)',collaborates.ids)
      projectarr = []
      projects.each do |p|
        defaultprojectid = 0
        if user.defaultprojectid == p.id
          defaultprojectid = 1
        end
        param = {
            id:p.id,
            name: p.name,
            summary: p.summary,
            isdefault: defaultprojectid
        }
        projectarr.push param
      end
    else
      status = 201
      msg = '无效的用户信息认证'
    end
    return_result(projectarr,status,msg)
  end

  def new_project
    param = {
        module:Systemmodule.first,
        users:User.all
    }
    user = User.find_by_token(request.headers[:UserToken].to_s)
    if user
      users = User.where('id != user.id')
      userarr = []
      users.each do |us|
        us.name.to_s.size > 0 ? username = us.name.to_s : username.us.nickname.to_s
        param = {
            id: us.id,
            name: username,
            phone: us.phone.to_s
        }
        userarr.push param
      end
    end
    return_result(param)
  end

  def create_project
    status = 200
    msg = 'OK'
    user = User.find_by_token(request.headers[:UserToken].to_s)
    if user
      project = Project.create(name:params[:name], summary:params[:summary], examine:params[:examine], begindate:Time.now, enddate:Time.now, user_id:user.id)
      project.create_projectmodule(notice:params[:module][:notice], document:params[:module][:document], contact:params[:module][:contact], myorder:params[:module][:myorder], talkover:params[:module][:talkover])
      params[:user].each do |us|
        autharr =[]
        if us[:admin] == 1
          autharr.push 'admin'
        end
        if us[:path] == 1
          autharr.push 'path'
        end
        user.collaborates.create(project_id:project.id,auth:autharr.map{|n|n}.join(','))
      end
      user.collaborates.create(project_id:project.id,auth:'ower')
      user.defaultprojectid = project.id
      user.save
      currentprojectid = project.id
    else
      status = 201
      msg = '无效的用户信息认证'
    end

    param = {
        currentprojectid: currentprojectid,
        notice:project.projectmodule.notice,
        document:project.projectmodule.document,
        contact:project.projectmodule.contact,
        myorder:project.projectmodule.myorder,
        talkover:project.projectmodule.talkover
    }
    return_result(param,status,msg)
  end

  def edit_project
    project = Project.find(params[:projectid])
    projectmodule = project.projectmodule
    pro = {
        name: project.name,
        summary: project.summary,
        examine: project.examine,
        notice: projectmodule.notice.to_i,
        document: projectmodule.document.to_i,
        contact: projectmodule.contact.to_i,
        myorder: projectmodule.myorder.to_i,
        talkover: projectmodule.talkover.to_i
    }
    userarr = []
    users = User.all
    users.each do |us|
      us.name.to_s.size == 0 ? username = us.nickname.to_s : username = us.name.to_s
      userparams = {
          id: us.id,
          name: username,
          phone: us.phone.to_s,
          isselect: 0,
          admin: 0,
          path: 0
      }
      userarr.push userparams
    end
    collaborates = project.collaborates
    collaborates.each do |collaborate|
      userarr.each do |us|
        if collaborate.user_id == us.id
          us.isselect = 1
          if collaborate.auth.include?('admin')
            us.admin = 1
          end
          if collaborate.auth.include?('path')
            us.path = 1
          end
          break
        end
      end
    end
    params = {
        project: pro,
        user: userarr
    }
    return_result(params)
  end

  def before_create_project
    param = {
        module:Systemmodule.first,
        users:User.all
    }
    if params[:projectid] && params[:projectid].to_i != 0
      project = Project.find(params[:projectid])
    end
    return_result(param)
  end



  def get_ower
    status = 200
    msg = 'OK'
    user = User.find_by_token(request.headers[:UserToken].to_s)
    if user
      collaborates = user.collaborates
      questions = user.questions
      intask = 0
      questions.each do |q|
        if q.questionstatu.iscomplete != 1
          intask += 1
        end
      end
      username = user.nickname.to_s
      if user.name.to_s.size > 0
        username = user.name
      end
      currentprojectname = ''
      notice = 0
      document = 0
      contact = 1
      myorder = 0
      talkover = 0
      if user.defaultprojectid.to_i > 0
        currentproject = Project.find(user.defaultprojectid)
        currentprojectname = currentproject.name
        projectmodule = currentproject.projectmodule
        notice = projectmodule.notice
        document = projectmodule.document
        contact = projectmodule.contact
        myorder = projectmodule.myorder
        talkover = projectmodule.talkover
      end

      params = {
          username: username,
          phone: user.phone.to_s,
          headurl: user.headurl.to_s,
          projectcount: collaborates.size,
          taskcount: questions.size,
          intaskcount: intask,
          currentproject: currentprojectname,
          notice: notice,
          document: document,
          contact: contact,
          myorder: myorder,
          talkover: talkover
      }
    else
      status = 201
      msg = '无效的用户信息认证'
    end
    return_result(params,status,msg)
  end



  def before_create_order
    status = 200
    msg = 'OK'
    user = User.find_by_token(request.headers[:UserToken].to_s)
    if user
      users = User.all
      userarr = []
      param = {
          id:user.id,
          name:'我',
          phone:''
      }
      userarr.push param
      users.each do |us|
        if us.id != user.id
          name =  us.name.to_s.size == 0 ? us.nickname.to_s : us.name.to_s
          param = {
              id:us.id,
              name:name,
              phone:us.phone.to_s
          }
          userarr.push param
        end
      end
      systemmodule = Systemmodule.first
      initmodule = {
          notice:systemmodule.notice,
          document:systemmodule.document,
          contact:systemmodule.contact,
          myorder:systemmodule.myorder,
          talkover:systemmodule.talkover
      }
      param={
          user:userarr,
          systemmodule:initmodule
      }
    else
      status = 201
      msg = '无效的用户信息认证'
    end
    return_result(param,status,msg)
  end

  def create_order
    user = User.find_by_token(request.headers[:UserToken].to_s)
    project = Project.find(request.headers[:currentProject])
    if user
      order = user.orders.create(project_id:project.id, name:params[:name], summary:params[:summary],assign_id:params[:assign_id])
      amount = 0.0
      params[:orderdetails].each do |orderdetail|
        order.orderdetails.create(name:orderdetail[:name], number:orderdetail[:number], price:orderdetail[:price],total:orderdetail[:number].to_f * orderdetail[:price].to_f)
        amount += orderdetail[:number].to_f * orderdetail[:price].to_f
      end
      order.amount = amount
      order.save
    end
    debugger
    return_result('')
  end

  def get_order_list
    status = 200
    msg = 'OK'
    user = User.find_by_token(request.headers[:UserToken].to_s)
    if user
      finished = 0
      page = params[:page].to_i
      if page == 0
        page = 1
      end
      orders = (user.orders.or(Order.where('assign_id = ?',user.id))).page(page).per(10).order('id desc')
      page_orders = (user.orders.or(Order.where('assign_id = ?',user.id))).page(page + 1).per(10).order('id desc')
      if page_orders.size > 0 && orders.last.id == page_orders.last.id
        finished = 1
      elsif page_orders.size == 0
        finished = 1
      end
      orderarr = []
      orders.each do |order|
        params = {
            id:order.id,
            name:order.name,
            summary:order.summary,
            assign: User.find(order.assign_id).name ? User.find(order.assign_id).name.to_s : User.find(order.assign_id).nickname.to_s,
            amount: order.amount.to_f,
            user: order.user.name ? order.user.name.to_s : order.user.nickname.to_s,
            date: format_date(order.created_at)
        }
        orderarr.push params
      end
      res = {
          finished: finished,
          data: orderarr
      }
      return_result(res)
    end
  end

  def get_notice_list
    user = User.find_by_token(request.headers[:UserToken].to_s)
    project = Project.find(request.headers[:currentProject])
    notices = project.notices.page(params[:page]).per(10).order('id desc')
    finished = 0
    last_notice = project.notices.order('id desc').last
    if notices.last.id == last_notice.id
      finished = 1
    end
    noticearr = []
    notifids = Notif.where('redirect_id in (?) and user_id = ?',notices.ids, user.id).ids
    notices.each do |notice|
      unread = 0
      if notifids.include?(notice.id)
        unread = 1
      end
      param = {
          id:notice.id,
          name:notice.name,
          notice:notice.notice,
          unread:unread
      }
      noticearr.push param
    end
    param={
        notices:noticearr,
        finished:finished
    }
    return_result(param)
  end

  def create_notice
    user = User.find_by_token(request.headers[:UserToken].to_s)
    project = Project.find(request.headers[:currentProject].to_s)
    notice = project.notices.create(user_id:user.id, name:params[:name], notice:params[:notice])
    noticecla = Notifcla.find_by_keyword('notice')
    collaborates = project.collaborates
    collaborates.each do |collaborate|
      if collaborate.user_id != user.id
        Notif.create(notifcla_id:noticecla.id, user_id:collaborate.user_id, name:params[:name], message:params[:notice][0..80], redirect_id:notice.id)
      end
    end

    return_result('',200)
  end

  def show_notice
    user = User.find_by_token(request.headers[:UserToken].to_s)
    notice = Notice.find(params[:noticeid])
    notif = Notif.where('user_id = ? and redirect_id = ?',user.id, notice.id)
    if notif.size > 0
      notif = notif.first
      notifcla = notif.notifcla
      if notifcla.keyword == 'notice'
        notif.destroy
      end
    end
    user.name.to_s.size > 0 ? username = user.name.to_s : username = user.nickname.to_s
    param = {
        noticeid: notice.id,
        name: notice.name,
        notice: notice.notice,
        created_by: username,
        created_at: format_date(notice.created_at),
        token: user.token
    }
    return_result(param)
  end

  def update_notice
    notice = Notice.find(params[:noticeid])
    notice.name = params[:name]
    notice.notice = params[:notice]
    notice.save
    return_result('')
  end

  def delete_notice
    notice = Notice.find(params[:noticeid])
    notifcla = Notifcla.find_by_keyword('notice')
    notifs = Notif.where('redirect_id = ? and notifcla_id = ?',params[:noticeid],notifcla.id)
    notifs.destroy_all
    notice.destroy
    return_result('')
  end

  def get_contact
    user = User.find_by_token(request.headers[:UserToken].to_s)
    contacts = Contact.where('user_id = ? or visual = ?',user.id,0)
    pinyindef = ('a'..'z').to_a
    pinyindef.each do |pinyind|
      index = pinyind.upcase
      indexlist = []
      subindex = []
      contacts.each do |contact|
        if contact.pinyin[0] == pinyind
          param = {
              id:contact.id,
              name:contact.name,
              project:contact.project.name
          }
          subindex.push param
        end
      end
      if subindex.size > 0
        params = {
            index:index,
            subindex:subindex
        }
        indexlist.push params
      end
      return_result(indexlist)
    end

  end

  def create_contact
    user = User.find_by_token(request.headers[:UserToken].to_s)
    project = Project.find(request.headers[:currentProject].to_s)
    Contact.create(project_id:project.id, user_id:user.id, contact:params[:name], phone:params[:phone], birthday:params[:birthday], position:params[:position], address:params[:province] + params[:city] + params[:district] + params[:address], adcode:params[:adcode])
    return_result('')
  end

  private

  def return_result(data, status = 200, msg = 'OK')
    params = {
        status:status,
        msg:msg,
        result:data
    }
    render json: params.to_json, content_type: "application/javascript"
  end

  def format_date(date)
    res = ''
    diff = (Time.now - date) / 60
    if diff < 1
      res = '刚刚'
    elsif  diff < 60
      res = diff.to_i.to_s + '分钟前'
    elsif diff < 1440
      res = (diff / 60).to_i.to_s + '小时前'
    else
      res = date.strftime('%Y-%m-%d %H:%M:%S')
    end
    res
  end

end
