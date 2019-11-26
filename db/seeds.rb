# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.find_by_login('admin')
if !admin
  User.create(login:'admin', name:'管理员', password:'admin', password_confirmation:'admin', status:1)
  puts '管理员初始化成功'
else
  puts '管理员已存在，忽略'
end

questionstatus = Questionstatu.all
if questionstatus.size == 0
  Questionstatu.create(statu:'新建', isdefault:1)
  Questionstatu.create(statu:'进行中', isdefault:0)
  Questionstatu.create(statu:'已解决', isdefault:0, iscomplete:1)
  Questionstatu.create(statu:'反馈', isdefault:0)
  Questionstatu.create(statu:'已关闭', isdefault:0, iscomplete:1)
  Questionstatu.create(statu:'已拒绝', isdefault:0, iscomplete:1)
  puts '任务状态初始化成功'
else
  puts '任务状态已存在值，忽略'
end

questionpris = Questionpri.all
if questionpris.size == 0
  Questionpri.create(pri:'低', isdefault:0)
  Questionpri.create(pri:'普通', isdefault:1)
  Questionpri.create(pri:'高', isdefault:0)
  Questionpri.create(pri:'紧急', isdefault:0)
  Questionpri.create(pri:'立刻', isdefault:0)
  puts '任务优先级初始化成功'
else
  puts '任务优先级已存在值，忽略'
end

systemmodules = Systemmodule.all
if systemmodules.size == 0
  Systemmodule.create(notice:1, document:0, contact:0, myorder:0, talkover:0)
  puts '新项目默认模块初始化成功'
else
  puts '新项目默认模块已存在，忽略'
end

noticecla_notice = Notifcla.find_by_keyword('notice')
if noticecla_notice
  puts '公告分类已存在，忽略'
else
  Notifcla.create(cla:'公告', keyword:'notice')
  puts '公告消息类创建成功'
end

noticecla_document = Notifcla.find_by_keyword('document')
if noticecla_document
  puts '文档分类已存在，忽略'
else
  Notifcla.create(cla:'文档', keyword:'document')
  puts '文档消息类创建成功'
end

noticecla_contact = Notifcla.find_by_keyword('contact')
if noticecla_contact
  puts '文档分类已存在，忽略'
else
  Notifcla.create(cla:'联系人', keyword:'contact')
  puts '联系人消息类创建成功'
end

noticecla_myorder = Notifcla.find_by_keyword('myorder')
if noticecla_myorder
  puts '订单分类已存在，忽略'
else
  Notifcla.create(cla:'订单', keyword:'myorder')
  puts '订单消息类创建成功'
end

noticecla_talkover = Notifcla.find_by_keyword('talkover')
if noticecla_talkover
  puts '讨论分类已存在，忽略'
else
  Notifcla.create(cla:'讨论', keyword:'talkover')
  puts '讨论消息类创建成功'
end