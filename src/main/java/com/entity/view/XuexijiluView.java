package com.entity.view;

import com.entity.XuexijiluEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;

import java.io.Serializable;
import com.utils.EncryptUtil;
 

/**
 * 学习记录
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2025-04-04 20:12:48
 */
@TableName("xuexijilu")
public class XuexijiluView  extends XuexijiluEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public XuexijiluView(){
	}
 
 	public XuexijiluView(XuexijiluEntity xuexijiluEntity){
 	try {
			BeanUtils.copyProperties(this, xuexijiluEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
