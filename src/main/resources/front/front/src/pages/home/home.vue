<template>
	<div class="home-preview">




		<!-- 商品推荐 -->
		<div id="animate_recommendxuexiziyuan" class="recommend animate__animated">
			<div class="recommend_title_box">
				<span class="recommend_title">学习资源推荐</span>
				<span class="recommend_subhead">{{'xuexiziyuan'.toUpperCase()}} RECOMMEND</span>
			</div>
			<div v-if="xuexiziyuanRecommend.length" class="list list12 index-pv1 list12xuexiziyuan">
				<div class="list-body">
					<div class="item list-item animation-box" v-for="item,index in xuexiziyuanRecommend" :key="index" @click="toDetail('xuexiziyuanDetail', item)">
						<img :name="item.id" v-if="preHttp(item.fengmian)&&preHttp2(item.fengmian)" :src="item.fengmian" alt="" />
						<img :name="item.id" v-else-if="preHttp(item.fengmian)" :src="item.fengmian.split(',')[0]" alt="" />
						<img :name="item.id" v-else :src="baseUrl + (item.fengmian?item.fengmian.split(',')[0]:'')" alt="" />
						<div class="name">{{item.ziyuanmingcheng}}</div>
						<div class="name">{{item.ziyuanfenlei}}</div>
					</div>
				</div>
			</div>
			<div class="moreBtn" @click="moreBtn('xuexiziyuan')">
				<span class="text">查看更多</span>
				<i class="icon iconfont icon-gengduo1"></i>
			</div>
		</div>
		<!-- 商品推荐 -->
	</div>
</template>

<script>
import 'animate.css'
import Swiper from "swiper";

	export default {
		//数据集合
		data() {
			return {
				baseUrl: '',
				newsList: [],
				xuexiziyuanRecommend: [],



				recommendIndex12xuexiziyuan: 0,
				recommendList12xuexiziyuan: [],
				recommendColumn12xuexiziyuan: '',


			}
		},
		created() {
			this.baseUrl = this.$config.baseUrl;
			this.getList();
			this.xuexiziyuanRecommendCate()
		},
		mounted() {
			window.addEventListener('scroll', this.handleScroll)
			setTimeout(()=>{
				this.handleScroll()
			},100)
			
			this.swiperChanges()
		},
		beforeDestroy() {
			window.removeEventListener('scroll', this.handleScroll)
		},
		//方法集合
		methods: {
			swiperChanges() {
				setTimeout(()=>{
				},750)
			},
			xuexiziyuanRecommendCate(){
				this.$http.get('ziyuanfenlei/list',{
					params: {
						limit: Number(8)
					}
				}).then(res => {
					if (res.data.code == 0) {
						this.recommendList12xuexiziyuan = res.data.data.list
					}
				});
				this.recommendColumn12xuexiziyuan = 'ziyuanfenlei'
			},
			recommendIndexClick12(index, name) {
				this['recommendIndex12' + name] = index
				this.getList()
				
				document.querySelectorAll('.recommend .list12' + name + ' .list .item').forEach(el => {
					el.classList.remove("active")
				})
				setTimeout(() => {
					document.querySelectorAll('.recommend .list12' + name + ' .list .item').forEach(el => {
						el.classList.add("active")
					})
				}, 1);
			},


			handleScroll() {
				let arr = [
					{id:'about',css:'animate__fadeInLeftBig'},
					{id:'system',css:'animate__slideInUp'},
					{id:'animate_recommendxuexiziyuan',css:'animate__zoomIn'},
				]
			
				for (let i in arr) {
					let doc = document.getElementById(arr[i].id)
					if (doc) {
						let top = doc.offsetTop
						let win_top = window.innerHeight + window.pageYOffset
						// console.log(top,win_top)
						if (win_top > top && doc.classList.value.indexOf(arr[i].css) < 0) {
							// console.log(doc)
							doc.classList.add(arr[i].css)
						}
					}
				}
			},
			preHttp(str) {
				return str && str.substr(0,4)=='http';
			},
			preHttp2(str) {
				return str && str.split(',w').length>1;
			},
			getList() {
				let autoSortUrl = "";
				let data = {}
				autoSortUrl = "xuexiziyuan/autoSort";
				if(localStorage.getItem('frontToken')) {
					autoSortUrl = "xuexiziyuan/autoSort2";
				}
				data = {
					page: 1,
					limit: 10,
				}
				if(this.recommendIndex12xuexiziyuan != 0){
					data.ziyuanfenlei = this.recommendList12xuexiziyuan[this.recommendIndex12xuexiziyuan - 1].ziyuanfenlei
				}
				this.$http.get(autoSortUrl, {params: data}).then(res => {
					if (res.data.code == 0) {
						this.xuexiziyuanRecommend = res.data.data.list;
					}
				});
			
			},
			toDetail(path, item) {
				this.$router.push({path: '/index/' + path, query: {id: item.id}});
			},
			moreBtn(path) {
				this.$router.push({path: '/index/' + path});
			}
		}
	}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.home-preview {
		margin: 0px auto;
		flex-direction: column;
		background: #fff;
		display: flex;
		width: 100%;
		.recommend {
			padding: 30px 0 10px;
			margin: 0px auto;
			background: rgb(239, 239, 239);
			width: 100%;
			position: relative;
			text-align: center;
			order: 6;
			.recommend_title_box {
				padding: 0 0 28px 60px;
				margin: 0 auto;
				background: url(http://codegen.caihongy.cn/20250218/698c52a55fc042a28aacea71589d4e23.png) no-repeat left center / 700px 100%;
				width: 1200px;
				position: relative;
				text-align: center;
				.recommend_title {
					margin: 0 auto;
					color: rgb(25, 190, 212);
					background: none;
					font-weight: 600;
					display: block;
					letter-spacing: 1px;
					width: auto;
					font-size: 28px;
					line-height: 40px;
					text-align: left;
				}
				.recommend_subhead {
					margin: 0;
					color: #999;
					display: none;
					width: 100%;
					font-size: 18px;
					line-height: 40px;
					text-align: center;
				}
			}
			.index-pv1 .animation-box {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				z-index: initial;
			}
			
			.index-pv1 .animation-box:hover {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
				z-index: 1;
			}
			
			.index-pv1 .animation-box img {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			}
			
			.index-pv1 .animation-box img:hover {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
			}
			.list12 {
				padding: 0;
				margin: 0 auto;
				background: none;
				width: 1200px;
				height: auto;
				.tab_view {
					margin: 0 0 40px;
					display: flex;
					width: 100%;
					justify-content: center;
					height: auto;
					.tab {
						cursor: pointer;
						border: 0px solid rgb(0, 0, 0);
						padding: 0 20px;
						margin: 0 10px;
						color: rgb(25, 190, 212);
						display: flex;
						width: 140px;
						font-size: 16px;
						line-height: 70px;
						align-items: center;
						img {
							margin: 0 5px 0 0;
							object-fit: cover;
							display: block;
							width: 34px;
							height: 34px;
						}
						.text {
							color: inherit;
							font-size: 16px;
						}
					}
					.tab:hover {
						border: 0px solid #ddd;
						color: #fff;
						background: url(http://codegen.caihongy.cn/20250218/eb9fc96db122406ebbd41cc9ddb60a9e.png) center/100% 100%;
					}
					.tab.active {
						color: #fff;
						background: url(http://codegen.caihongy.cn/20250218/eb9fc96db122406ebbd41cc9ddb60a9e.png) center/100% 100%;
						border-color: rgb(0, 0, 0);
						border-width: 0px;
						border-style: solid;
					}
					.more_btn {
						cursor: pointer;
						padding: 5px 10px;
						margin: 0 10px;
						color: #666;
						background: #fff;
						display: none;
						line-height: 44px;
						align-items: center;
						.text {
							color: inherit;
							font-size: 16px;
						}
						.icon {
							margin: 0 0 0 2px;
							color: inherit;
							font-size: 16px;
						}
					}
					.more_btn:hover {
						color: red;
					}
					.tab.active {
						animation-name: mymove;
					
						&:nth-of-type(1) {
							animation-duration: 1s;
						}
						&:nth-of-type(2) {
							animation-duration: 1.2s;
						}
						&:nth-of-type(3) {
							animation-duration: 1.4s;
						}
						&:nth-of-type(4) {
							animation-duration: 1.6s;
						}
						&:nth-of-type(5) {
							animation-duration: 1.8s;
						}
						&:nth-of-type(6) {
							animation-duration: 2s;
						}
					}
					
					@keyframes mymove {
						from {top: 320px;}
						to {top: 0;}
					}
				}
				.list-body {
					overflow: hidden;
					flex: 1;
					background: none;
					display: flex;
					gap: 12px;
					flex-wrap: wrap;
					height: auto;
					.list-item {
						cursor: pointer;
						border-radius: 10px;
						padding: 0 0 10px 0;
						margin: 0;
						background: #fff;
						width: 230px;
						border-width: 0 0px 0 0;
						position: relative;
						border-style: dashed ;
						height: auto;
						img {
							border-radius: 10px;
							object-fit: cover;
							display: block;
							width: 100%;
							height: 260px;
						}
						.name {
							padding: 0 5px;
							overflow: hidden;
							color: #333;
							white-space: nowrap;
							width: 100%;
							font-size: 15px;
							line-height: 30px;
							text-overflow: ellipsis;
							text-align: center;
						}
						.price {
							padding: 0px;
							color: #f00;
							font-size: 16px;
							line-height: 1.5;
						}
					}
					.list-item.active {
						animation-name: mymove;
					
						&:nth-of-type(1) {
							animation-duration: 1s;
						}
						&:nth-of-type(2) {
							animation-duration: 1.2s;
						}
						&:nth-of-type(3) {
							animation-duration: 1.4s;
						}
						&:nth-of-type(4) {
							animation-duration: 1.6s;
						}
						&:nth-of-type(5) {
							animation-duration: 1.8s;
						}
						&:nth-of-type(6) {
							animation-duration: 2s;
						}
					}
					
					@keyframes mymove {
						from {top: 320px;}
						to {top: 0;}
					}
				}
			}
			.moreBtn {
				border: 0px solid #000;
				cursor: pointer;
				padding: 0 20px;
				margin: 30px auto;
				color: #fff;
				display: inline-block;
				line-height: 60px;
				right: calc(50% - 600px);
				border-radius: 25px;
				top: 0;
				background: url("http://codegen.caihongy.cn/20250218/eb9fc96db122406ebbd41cc9ddb60a9e.png") center center / 100% 100%;
				width: 130px;
				position: absolute;
				text-align: center;
				.text {
					font-size: 16px;
				}
				.icon {
					color: #fff;
					display: none;
					font-size: 15px;
				}
			}
		}
	}
</style>
