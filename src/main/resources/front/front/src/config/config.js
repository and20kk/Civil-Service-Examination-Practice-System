export default {
	baseUrl: 'http://localhost:8080/springbootq5xf6w8j/',
	name: '/springbootq5xf6w8j',
	indexNav: [
		{
			name: '学习资源',
			url: '/index/xuexiziyuan',
		},
		{
			name: '互动交流',
			url: '/index/forum'
		}, 
		{
			name: '题库',
			url: '/index/examPaper'
		}, 
	],
	cateList: [
		{
			name: '学习资源',
			refTable: 'ziyuanfenlei',
			refColumn: 'ziyuanfenlei',
		},
		{
			name: '互动交流',
			refTable: 'forumtype',
			refColumn: 'typename',
		},
	]
}
