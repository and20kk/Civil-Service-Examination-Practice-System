package com.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.*;
import java.lang.*;
import java.math.*;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import com.utils.ValidatorUtils;
import com.utils.DeSensUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;

import com.entity.XuexijiluEntity;
import com.entity.view.XuexijiluView;

import com.service.XuexijiluService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * 学习记录
 * 后端接口
 * @author 
 * @email 
 * @date 2025-04-04 20:12:48
 */
@RestController
@RequestMapping("/xuexijilu")
public class XuexijiluController {
    @Autowired
    private XuexijiluService xuexijiluService;






    



    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,XuexijiluEntity xuexijilu,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("yonghu")) {
			xuexijilu.setYonghuzhanghao((String)request.getSession().getAttribute("username"));
		}
        //设置查询条件
        EntityWrapper<XuexijiluEntity> ew = new EntityWrapper<XuexijiluEntity>();


        //查询结果
		PageUtils page = xuexijiluService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, xuexijilu), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }
    
    /**
     * 前台列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,XuexijiluEntity xuexijilu, 
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<XuexijiluEntity> ew = new EntityWrapper<XuexijiluEntity>();

        //查询结果
		PageUtils page = xuexijiluService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, xuexijilu), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }



	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( XuexijiluEntity xuexijilu){
       	EntityWrapper<XuexijiluEntity> ew = new EntityWrapper<XuexijiluEntity>();
      	ew.allEq(MPUtil.allEQMapPre( xuexijilu, "xuexijilu")); 
        return R.ok().put("data", xuexijiluService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(XuexijiluEntity xuexijilu){
        EntityWrapper< XuexijiluEntity> ew = new EntityWrapper< XuexijiluEntity>();
 		ew.allEq(MPUtil.allEQMapPre( xuexijilu, "xuexijilu")); 
		XuexijiluView xuexijiluView =  xuexijiluService.selectView(ew);
		return R.ok("查询学习记录成功").put("data", xuexijiluView);
    }
	
    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        XuexijiluEntity xuexijilu = xuexijiluService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(xuexijilu,deSens);
        return R.ok().put("data", xuexijilu);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        XuexijiluEntity xuexijilu = xuexijiluService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(xuexijilu,deSens);
        return R.ok().put("data", xuexijilu);
    }
    



    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody XuexijiluEntity xuexijilu, HttpServletRequest request){
        //ValidatorUtils.validateEntity(xuexijilu);
        xuexijiluService.insert(xuexijilu);
        return R.ok().put("data",xuexijilu.getId());
    }
    
    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody XuexijiluEntity xuexijilu, HttpServletRequest request){
        //ValidatorUtils.validateEntity(xuexijilu);
        xuexijiluService.insert(xuexijilu);
        return R.ok().put("data",xuexijilu.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody XuexijiluEntity xuexijilu, HttpServletRequest request){
        //ValidatorUtils.validateEntity(xuexijilu);
        //全部更新
        xuexijiluService.updateById(xuexijilu);
        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        xuexijiluService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    








}
