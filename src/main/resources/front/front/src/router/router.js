import VueRouter from 'vue-router'
//引入组件
import Index from '../pages'
import Home from '../pages/home/home'
import Login from '../pages/login/login'
import Register from '../pages/register/register'
import Center from '../pages/center/center'
import Forum from '../pages/forum/list'
import ForumAdd from '../pages/forum/add'
import ForumDetail from '../pages/forum/detail'
import MyForumList from '../pages/forum/myForumList'
import ExamPaper from '../pages/exam/examPaper'
import Exam from '../pages/exam/exam'
import ExamList from '../pages/exam/examList'
import ExamRecord from '../pages/exam/examRecord'
import Storeup from '../pages/storeup/list'
import payList from '../pages/pay'

import yonghuList from '../pages/yonghu/list'
import yonghuDetail from '../pages/yonghu/detail'
import yonghuAdd from '../pages/yonghu/add'
import ziyuanfenleiList from '../pages/ziyuanfenlei/list'
import ziyuanfenleiDetail from '../pages/ziyuanfenlei/detail'
import ziyuanfenleiAdd from '../pages/ziyuanfenlei/add'
import xuexijiluList from '../pages/xuexijilu/list'
import xuexijiluDetail from '../pages/xuexijilu/detail'
import xuexijiluAdd from '../pages/xuexijilu/add'
import tixingxinxiList from '../pages/tixingxinxi/list'
import tixingxinxiDetail from '../pages/tixingxinxi/detail'
import tixingxinxiAdd from '../pages/tixingxinxi/add'
import xuexiziyuanList from '../pages/xuexiziyuan/list'
import xuexiziyuanDetail from '../pages/xuexiziyuan/detail'
import xuexiziyuanAdd from '../pages/xuexiziyuan/add'
import forumtypeList from '../pages/forumtype/list'
import forumtypeDetail from '../pages/forumtype/detail'
import forumtypeAdd from '../pages/forumtype/add'
import forumreportList from '../pages/forumreport/list'
import forumreportDetail from '../pages/forumreport/detail'
import forumreportAdd from '../pages/forumreport/add'
import discussxuexiziyuanList from '../pages/discussxuexiziyuan/list'
import discussxuexiziyuanDetail from '../pages/discussxuexiziyuan/detail'
import discussxuexiziyuanAdd from '../pages/discussxuexiziyuan/add'

const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
	return originalPush.call(this, location).catch(err => err)
}

//配置路由
export default new VueRouter({
	routes:[
		{
      path: '/',
      redirect: '/index/home'
    },
		{
			path: '/index',
			component: Index,
			children:[
				{
					path: 'home',
					component: Home
				},
				{
					path: 'center',
					component: Center,
				},
				{
					path: 'pay',
					component: payList,
				},
				{
					path: 'forum',
					component: Forum
				},
				{
					path: 'forumAdd',
					component: ForumAdd
				},
				{
					path: 'forumDetail',
					component: ForumDetail
				},
				{
					path: 'myForumList',
					component: MyForumList
				},
				{
					path: 'examPaper',
					component: ExamPaper
				},
				{
					path: 'examList',
					component:ExamList
				},
				{
					path: 'examRecord/:type',
					component:ExamRecord
				},
				{
					path: 'storeup',
					component: Storeup
				},
				{
					path: 'yonghu',
					component: yonghuList
				},
				{
					path: 'yonghuDetail',
					component: yonghuDetail
				},
				{
					path: 'yonghuAdd',
					component: yonghuAdd
				},
				{
					path: 'ziyuanfenlei',
					component: ziyuanfenleiList
				},
				{
					path: 'ziyuanfenleiDetail',
					component: ziyuanfenleiDetail
				},
				{
					path: 'ziyuanfenleiAdd',
					component: ziyuanfenleiAdd
				},
				{
					path: 'xuexijilu',
					component: xuexijiluList
				},
				{
					path: 'xuexijiluDetail',
					component: xuexijiluDetail
				},
				{
					path: 'xuexijiluAdd',
					component: xuexijiluAdd
				},
				{
					path: 'tixingxinxi',
					component: tixingxinxiList
				},
				{
					path: 'tixingxinxiDetail',
					component: tixingxinxiDetail
				},
				{
					path: 'tixingxinxiAdd',
					component: tixingxinxiAdd
				},
				{
					path: 'xuexiziyuan',
					component: xuexiziyuanList
				},
				{
					path: 'xuexiziyuanDetail',
					component: xuexiziyuanDetail
				},
				{
					path: 'xuexiziyuanAdd',
					component: xuexiziyuanAdd
				},
				{
					path: 'forumtype',
					component: forumtypeList
				},
				{
					path: 'forumtypeDetail',
					component: forumtypeDetail
				},
				{
					path: 'forumtypeAdd',
					component: forumtypeAdd
				},
				{
					path: 'forumreport',
					component: forumreportList
				},
				{
					path: 'forumreportDetail',
					component: forumreportDetail
				},
				{
					path: 'forumreportAdd',
					component: forumreportAdd
				},
				{
					path: 'discussxuexiziyuan',
					component: discussxuexiziyuanList
				},
				{
					path: 'discussxuexiziyuanDetail',
					component: discussxuexiziyuanDetail
				},
				{
					path: 'discussxuexiziyuanAdd',
					component: discussxuexiziyuanAdd
				},
			]
		},
		{
			path: '/login',
			component: Login
		},
		{
			path: '/register',
			component: Register
		},
		{
			path: '/exam',
			component: Exam
		}
	]
})
