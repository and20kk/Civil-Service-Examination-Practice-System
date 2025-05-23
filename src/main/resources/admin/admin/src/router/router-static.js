import Vue from 'vue';
//配置路由
import VueRouter from 'vue-router'
Vue.use(VueRouter);
//1.创建组件
import Index from '@/views/index'
import Home from '@/views/home'
import Login from '@/views/login'
import NotFound from '@/views/404'
import UpdatePassword from '@/views/update-password'
import pay from '@/views/pay'
import register from '@/views/register'
import center from '@/views/center'
import adminexam from '@/views/modules/exampaperlist/exam'
	import tixingxinxi from '@/views/modules/tixingxinxi/list'
	import examquestion from '@/views/modules/examquestion/list'
	import exampaper from '@/views/modules/exampaper/list'
	import discussxuexiziyuan from '@/views/modules/discussxuexiziyuan/list'
	import xuexijilu from '@/views/modules/xuexijilu/list'
	import forum from '@/views/modules/forum/list'
	import forumtype from '@/views/modules/forumtype/list'
	import yonghu from '@/views/modules/yonghu/list'
	import forumreport from '@/views/modules/forumreport/list'
	import ziyuanfenlei from '@/views/modules/ziyuanfenlei/list'
	import config from '@/views/modules/config/list'
	import examrecord from '@/views/modules/examrecord/list'
	import xuexiziyuan from '@/views/modules/xuexiziyuan/list'


//2.配置路由   注意：名字
export const routes = [{
	path: '/',
	name: '系统首页',
	component: Index,
	children: [{
		// 这里不设置值，是把main作为默认页面
		path: '/',
		name: '系统首页',
		component: Home,
		meta: {icon:'', title:'center', affix: true}
	}, {
		path: '/updatePassword',
		name: '修改密码',
		component: UpdatePassword,
		meta: {icon:'', title:'updatePassword'}
	}, {
		path: '/pay',
		name: '支付',
		component: pay,
		meta: {icon:'', title:'pay'}
	}, {
		path: '/center',
		name: '个人信息',
		component: center,
		meta: {icon:'', title:'center'}
	}
	,{
		path: '/tixingxinxi',
		name: '提醒信息',
		component: tixingxinxi
	}
	,{
		path: '/examquestion',
		name: '题目管理',
		component: examquestion
	}
	,{
		path: '/exampaper',
		name: '题库管理',
		component: exampaper
	}
	,{
		path: '/discussxuexiziyuan',
		name: '学习资源评论',
		component: discussxuexiziyuan
	}
	,{
		path: '/xuexijilu',
		name: '学习记录',
		component: xuexijilu
	}
	,{
		path: '/forum',
		name: '互动交流',
		component: forum
	}
	,{
		path: '/forumtype',
		name: '论坛分类',
		component: forumtype
	}
	,{
		path: '/yonghu',
		name: '用户',
		component: yonghu
	}
	,{
		path: '/forumreport',
		name: '举报记录',
		component: forumreport
	}
	,{
		path: '/ziyuanfenlei',
		name: '资源分类',
		component: ziyuanfenlei
	}
	,{
		path: '/config',
		name: '轮播图管理',
		component: config
	}
	,{
		path: '/examrecord',
		name: '练习记录',
		component: examrecord
	}
	,{
		path: '/xuexiziyuan',
		name: '学习资源',
		component: xuexiziyuan
	}
	]
	},
	{
		path: '/adminexam',
		name: 'adminexam',
		component: adminexam,
		meta: {icon:'', title:'adminexam'}
	},
	{
		path: '/login',
		name: 'login',
		component: Login,
		meta: {icon:'', title:'login'}
	},
	{
		path: '/register',
		name: 'register',
		component: register,
		meta: {icon:'', title:'register'}
	},
	{
		path: '*',
		component: NotFound
	}
]
//3.实例化VueRouter  注意：名字
const router = new VueRouter({
	mode: 'hash',
	/*hash模式改为history*/
	routes // （缩写）相当于 routes: routes
})
const originalPush = VueRouter.prototype.push
//修改原型对象中的push方法
VueRouter.prototype.push = function push(location) {
	return originalPush.call(this, location).catch(err => err)
}
export default router;
