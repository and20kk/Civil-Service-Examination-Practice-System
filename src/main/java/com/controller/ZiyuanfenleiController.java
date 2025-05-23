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

import com.entity.ZiyuanfenleiEntity;
import com.entity.view.ZiyuanfenleiView;

import com.service.ZiyuanfenleiService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * 资源分类
 * 后端接口
 * @author 
 * @email 
 * @date 2025-04-04 20:12:48
 */
@RestController
@RequestMapping("/ziyuanfenlei")
public class ZiyuanfenleiController {
    @Autowired
    private ZiyuanfenleiService ziyuanfenleiService;






    



    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,ZiyuanfenleiEntity ziyuanfenlei,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<ZiyuanfenleiEntity> ew = new EntityWrapper<ZiyuanfenleiEntity>();


        //查询结果
		PageUtils page = ziyuanfenleiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, ziyuanfenlei), params), params));
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
    public R list(@RequestParam Map<String, Object> params,ZiyuanfenleiEntity ziyuanfenlei, 
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<ZiyuanfenleiEntity> ew = new EntityWrapper<ZiyuanfenleiEntity>();

        //查询结果
		PageUtils page = ziyuanfenleiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, ziyuanfenlei), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }



	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( ZiyuanfenleiEntity ziyuanfenlei){
       	EntityWrapper<ZiyuanfenleiEntity> ew = new EntityWrapper<ZiyuanfenleiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( ziyuanfenlei, "ziyuanfenlei")); 
        return R.ok().put("data", ziyuanfenleiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(ZiyuanfenleiEntity ziyuanfenlei){
        EntityWrapper< ZiyuanfenleiEntity> ew = new EntityWrapper< ZiyuanfenleiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( ziyuanfenlei, "ziyuanfenlei")); 
		ZiyuanfenleiView ziyuanfenleiView =  ziyuanfenleiService.selectView(ew);
		return R.ok("查询资源分类成功").put("data", ziyuanfenleiView);
    }
	
    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        ZiyuanfenleiEntity ziyuanfenlei = ziyuanfenleiService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(ziyuanfenlei,deSens);
        return R.ok().put("data", ziyuanfenlei);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        ZiyuanfenleiEntity ziyuanfenlei = ziyuanfenleiService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(ziyuanfenlei,deSens);
        return R.ok().put("data", ziyuanfenlei);
    }
    



    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody ZiyuanfenleiEntity ziyuanfenlei, HttpServletRequest request){
        //验证字段唯一性，否则返回错误信息
        if(ziyuanfenleiService.selectCount(new EntityWrapper<ZiyuanfenleiEntity>().eq("ziyuanfenlei", ziyuanfenlei.getZiyuanfenlei()))>0) {
            return R.error("资源分类已存在");
        }
        //ValidatorUtils.validateEntity(ziyuanfenlei);
        ziyuanfenleiService.insert(ziyuanfenlei);
        return R.ok().put("data",ziyuanfenlei.getId());
    }
    
    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody ZiyuanfenleiEntity ziyuanfenlei, HttpServletRequest request){
        //验证字段唯一性，否则返回错误信息
        if(ziyuanfenleiService.selectCount(new EntityWrapper<ZiyuanfenleiEntity>().eq("ziyuanfenlei", ziyuanfenlei.getZiyuanfenlei()))>0) {
            return R.error("资源分类已存在");
        }
        //ValidatorUtils.validateEntity(ziyuanfenlei);
        ziyuanfenleiService.insert(ziyuanfenlei);
        return R.ok().put("data",ziyuanfenlei.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody ZiyuanfenleiEntity ziyuanfenlei, HttpServletRequest request){
        //ValidatorUtils.validateEntity(ziyuanfenlei);
        //验证字段唯一性，否则返回错误信息
        if(ziyuanfenleiService.selectCount(new EntityWrapper<ZiyuanfenleiEntity>().ne("id", ziyuanfenlei.getId()).eq("ziyuanfenlei", ziyuanfenlei.getZiyuanfenlei()))>0) {
            return R.error("资源分类已存在");
        }
        //全部更新
        ziyuanfenleiService.updateById(ziyuanfenlei);
        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        ziyuanfenleiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    








}
