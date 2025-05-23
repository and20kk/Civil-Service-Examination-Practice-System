package com.entity.vo;

import com.entity.XuexijiluEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
 

/**
 * 学习记录
 * @author 
 * @email 
 * @date 2025-04-04 20:12:48
 */
public class XuexijiluVO  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 用户姓名
	 */
	
	private String yonghuxingming;
		
	/**
	 * 课程名称
	 */
	
	private String kechengmingcheng;
		
	/**
	 * 图片
	 */
	
	private String tupian;
		
	/**
	 * 记录时间
	 */
		
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 
	private Date jilushijian;
		
	/**
	 * 学习进度
	 */
	
	private String xuexijindu;
		
	/**
	 * 练习情况
	 */
	
	private String lianxiqingkuang;
		
	/**
	 * 学习记录
	 */
	
	private String xuexijilu;
				
	
	/**
	 * 设置：用户姓名
	 */
	 
	public void setYonghuxingming(String yonghuxingming) {
		this.yonghuxingming = yonghuxingming;
	}
	
	/**
	 * 获取：用户姓名
	 */
	public String getYonghuxingming() {
		return yonghuxingming;
	}
				
	
	/**
	 * 设置：课程名称
	 */
	 
	public void setKechengmingcheng(String kechengmingcheng) {
		this.kechengmingcheng = kechengmingcheng;
	}
	
	/**
	 * 获取：课程名称
	 */
	public String getKechengmingcheng() {
		return kechengmingcheng;
	}
				
	
	/**
	 * 设置：图片
	 */
	 
	public void setTupian(String tupian) {
		this.tupian = tupian;
	}
	
	/**
	 * 获取：图片
	 */
	public String getTupian() {
		return tupian;
	}
				
	
	/**
	 * 设置：记录时间
	 */
	 
	public void setJilushijian(Date jilushijian) {
		this.jilushijian = jilushijian;
	}
	
	/**
	 * 获取：记录时间
	 */
	public Date getJilushijian() {
		return jilushijian;
	}
				
	
	/**
	 * 设置：学习进度
	 */
	 
	public void setXuexijindu(String xuexijindu) {
		this.xuexijindu = xuexijindu;
	}
	
	/**
	 * 获取：学习进度
	 */
	public String getXuexijindu() {
		return xuexijindu;
	}
				
	
	/**
	 * 设置：练习情况
	 */
	 
	public void setLianxiqingkuang(String lianxiqingkuang) {
		this.lianxiqingkuang = lianxiqingkuang;
	}
	
	/**
	 * 获取：练习情况
	 */
	public String getLianxiqingkuang() {
		return lianxiqingkuang;
	}
				
	
	/**
	 * 设置：学习记录
	 */
	 
	public void setXuexijilu(String xuexijilu) {
		this.xuexijilu = xuexijilu;
	}
	
	/**
	 * 获取：学习记录
	 */
	public String getXuexijilu() {
		return xuexijilu;
	}
			
}
