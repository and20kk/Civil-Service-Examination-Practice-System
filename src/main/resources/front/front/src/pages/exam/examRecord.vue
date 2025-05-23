<template>
	<div :style='{"padding":"0 calc((100% - 1200px)/2) 20px","margin":"0px auto","color":"#666","background":"#fff","width":"100%","fontSize":"16px","position":"relative"}'>
		<div class="back_box">
			<el-button class="backBtn" size="mini" @click="backClick">
				<span class="icon iconfont icon-jiantou33"></span>
				<span class="text">返回</span>
			</el-button>
		</div>
		<div class="section-title" :style='{"padding":"0 0 0 50px","margin":"0px auto 0","color":"rgb(25, 190, 212)","textAlign":"left","background":"url(http://codegen.caihongy.cn/20250220/e85584abac2c4b3ebee6d1c211618e75.png) no-repeat center bottom","width":"100%","fontSize":"26px","lineHeight":"100px","position":"relative"}'>{{title}}</div>
		<el-table
			:data="tableData"
			style="width: 100%">
			<el-table-column
				label="题库名称"
				prop="papername">
			</el-table-column>
			<el-table-column
				label="题目"
				prop="questionname">
				<template slot-scope="scope">
					<div class="ql-snow ql-editor" v-html="scope.row.questionname"></div>
				</template>
			</el-table-column>
			<el-table-column
				prop="type"
				label="题目类型"
			>
				<template slot-scope="scope">
					<el-tag type="success" v-if="scope.row.type==0">单选题</el-tag>
					<el-tag type="warning" v-if="scope.row.type==1">多选题</el-tag>
					<el-tag type="info" v-if="scope.row.type==2">判断题</el-tag>
					<el-tag type="primary" v-if="scope.row.type==3">填空题</el-tag>
					<el-tag type="danger" v-if="scope.row.type==4">主观题</el-tag>
				</template>
			</el-table-column>
			<el-table-column
				label="分值">
				<template slot-scope="scope">
					{{ scope.row.score }}分
				</template>
			</el-table-column>
			<el-table-column
				label="正确答案"
				prop="right">
			</el-table-column>
			<el-table-column
				label="考生答案"
				prop="myanswer">
			</el-table-column>
			<el-table-column
				label="练习得分">
				<template slot-scope="scope">
					{{ scope.row.myscore }}分
				</template>
			</el-table-column>
		</el-table>
		<el-pagination
			background
			id="pagination" class="pagination"
			:pager-count="7"
			:page-size="pageSize"
			:page-sizes="pageSizes"
			prev-text="上一页"
			next-text="下一页"
			:hide-on-single-page="false"
			:layout='["total","prev","pager","next","sizes","jumper"].join()'
			:total="total"
			:style='{"padding":"0 calc((100% - 1400px)/2)","margin":"20px auto","whiteSpace":"nowrap","overflow":"hidden","color":"#333","textAlign":"center","width":"100%","clear":"both","fontSize":"16px","fontWeight":"500","order":"50"}'
			@current-change="curChange"
			@prev-click="prevClick"
			@size-change="sizeChange"
			@next-click="nextClick"
		></el-pagination>
	
	</div>
</template>

<script>
	export default {
		data() {
			return {
				layouts: '',
				title: '练习记录',
				tableData: [],
				total: 1,
				pageSize: 10,
				pageSizes: [],
				totalPage: 1
			}
		},
		created() {
			this.getExamRecord(1);
		},
		methods: {
			backClick() {
				this.$router.push('/index/center')
			},
			getExamRecord(page) {
				let otherParams = {};
				if (this.$route.params.type == 0) {
					this.title = '错题本';
					otherParams.myscore = 0;
					otherParams.ismark = 1
				}
				this.$http.get('examrecord/list', {params: Object.assign({page, limit: this.pageSize, paperid: this.$route.query.paperid, userid: Number(localStorage.getItem('frontUserid'))}, otherParams)}).then(res => {
					if (res.data.code == 0) {
						let arr = []
						for(let x in res.data.data.list){
							res.data.data.list[x].questionname = res.data.data.list[x].questionname.replace(/img src/gi,"img style=\"width:100%;\" src");
							if(res.data.data.list[x].type==0||res.data.data.list[x].type==2){
								arr = JSON.parse(res.data.data.list[x].options)
								for(let i in arr){
									if(res.data.data.list[x].answer == arr[i].code){
										res.data.data.list[x].right = arr[i].text
									}
								}
							}else if(res.data.data.list[x].type==1){
								arr = JSON.parse(res.data.data.list[x].options)
								res.data.data.list[x].answer.split(',').forEach(item=>{
									for(let i in arr){
										if (item == arr[i].code) {
											if (res.data.data.list[x].right) {
												res.data.data.list[x].right += ','
												res.data.data.list[x].right = res.data.data.list[x].right + arr[i].text
											}else{
												res.data.data.list[x].right = arr[i].text
											}
										}
									}
								})
							}else if(res.data.data.list[x].type==3){
								res.data.data.list[x].right = res.data.data.list[x].answer
							}else if(res.data.data.list[x].type==4){
								res.data.data.list[x].right = '略'
							}
						}
						this.tableData = res.data.data.list;
						this.total = res.data.data.total;
						this.pageSize = Number(res.data.data.pageSize);
						this.totalPage = res.data.data.totalPage;
						if(this.pageSizes.length==0){
							this.pageSizes = [this.pageSize, this.pageSize*2, this.pageSize*3, this.pageSize*5];
						}
					}
				});
			},
			curChange(page) {
				this.getExamRecord(page);
			},
			sizeChange(size){
				this.pageSize = size
				this.getExamRecord(1);
			},
			prevClick(page) {
				this.getExamRecord(page);
			},
			nextClick(page) {
				this.getExamRecord(page);
			},
			handleView(index, row) {
				this.$router.push({path: '/index/examRecord', query: {id: row.id}})
			}
		}
	}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.section {
		width: 900px;
		margin: 0 auto;
	}
</style>
