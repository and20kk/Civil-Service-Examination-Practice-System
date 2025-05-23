<template>
	<div :style='{"padding":"0 calc((100% - 1200px)/2) 20px","margin":"0px auto","color":"#666","background":"#fff","width":"100%","fontSize":"16px","position":"relative"}'>
		<div class="section-title" :style='{"padding":"0 0 0 50px","margin":"0px auto 0","color":"rgb(25, 190, 212)","textAlign":"left","background":"url(http://codegen.caihongy.cn/20250220/e85584abac2c4b3ebee6d1c211618e75.png) no-repeat center bottom","width":"100%","fontSize":"26px","lineHeight":"100px","position":"relative"}'>题库</div>
		<el-form :style='{"padding":"10px","margin":"20px 0","color":"inherit","flexWrap":"wrap","background":"none","display":"flex","width":"100%","fontSize":"inherit","height":"auto","order":"2"}' :inline="true" :model="formSearch" class="center-form-pv">
			<el-form-item :style='{"padding":"0","margin":"0 0px 10px 0","fontSize":"inherit","alignItems":"center","flexWrap":"wrap","display":"flex"}'>
				<div class="lable" v-if="true" :style='{"padding":"0 10px","whiteSpace":"nowrap","color":"#333","display":"inline-block","width":"auto","lineHeight":"40px","fontSize":"16px"}'>题库名称：</div>
				<el-input v-model="formSearch.name" placeholder="题库名称" @keydown.enter.native="getExamList(1)" clearable></el-input>
			</el-form-item>
			<el-button :style='{"cursor":"pointer","border":"0","padding":"0px 15px","margin":"0 10px 0 10px","color":"#fff","borderRadius":"0px","background":"rgb(25, 190, 212)","width":"auto","fontSize":"inherit","lineHeight":"40px","height":"40px"}' type="primary" @click="getExamList(1)"><i v-if="true" :style='{"color":"#fff","margin":"0 10px 0 0","fontSize":"inherit"}' class="el-icon-search"></i>查询</el-button>
		</el-form>
		<el-table
			:data="tableData"
			style="width: 100%">
			<el-table-column
				label="题库名称"
				prop="name">
			</el-table-column>
			<el-table-column
				label="练习时长">
				<template slot-scope="scope">
					{{ scope.row.time }}分钟
				</template>
			</el-table-column>
			<el-table-column
				label="创建时间"
				prop="addtime">
			</el-table-column>
			<el-table-column label="操作" width="150">
				<template slot-scope="scope">
					<el-button
					type="success"
					size="mini"
					@click="handleExam(scope.$index, scope.row)">练习</el-button>
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
				tableData: [],
				total: 1,
				pageSize: 10,
				pageSizes: [],
				totalPage: 1,
				formSearch: {}
			}
		},
		created() {
			this.getExamList(1);
		},
		methods: {
			getExamList(page) {
				let params = {page, limit: this.pageSize, status: 1,sort: 'addtime',order: 'desc'}
				if(this.formSearch.name){
					params['name'] = `%${this.formSearch.name}%`
				}
				this.$http.get('exampaper/list', {params: params}).then(res => {
					if (res.data.code == 0) {
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
		  sizeChange(size){
			this.pageSize = size
			this.getList(1);
		  },
			curChange(page) {
				this.getExamList(page);
			},
			prevClick(page) {
				this.getExamList(page);
			},
			nextClick(page) {
				this.getExamList(page);
			},
			handleExam(index, row) {
				this.$router.push({path: '/exam', query: {id: row.id, time: row.time}})
			}
		}
	}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.section {
		width: 900px;
		margin: 0 auto;
	}
	.center-form-pv .el-input {
		width: auto;
	}

  
</style>
