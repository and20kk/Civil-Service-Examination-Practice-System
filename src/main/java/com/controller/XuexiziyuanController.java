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
import com.utils.UserBasedCollaborativeFiltering;

import com.entity.XuexiziyuanEntity;
import com.entity.view.XuexiziyuanView;

import com.service.XuexiziyuanService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;
import com.service.StoreupService;
import com.entity.StoreupEntity;

/**
 * 学习资源
 * 后端接口
 * @author 
 * @email 
 * @date 2025-04-04 20:12:48
 */
@RestController
@RequestMapping("/xuexiziyuan")
public class XuexiziyuanController {
    @Autowired
    private XuexiziyuanService xuexiziyuanService;

    @Autowired
    private StoreupService storeupService;





    



    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,XuexiziyuanEntity xuexiziyuan,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<XuexiziyuanEntity> ew = new EntityWrapper<XuexiziyuanEntity>();


        //查询结果
		PageUtils page = xuexiziyuanService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, xuexiziyuan), params), params));
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
    public R list(@RequestParam Map<String, Object> params,XuexiziyuanEntity xuexiziyuan, 
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<XuexiziyuanEntity> ew = new EntityWrapper<XuexiziyuanEntity>();

        //查询结果
		PageUtils page = xuexiziyuanService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, xuexiziyuan), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }



	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( XuexiziyuanEntity xuexiziyuan){
       	EntityWrapper<XuexiziyuanEntity> ew = new EntityWrapper<XuexiziyuanEntity>();
      	ew.allEq(MPUtil.allEQMapPre( xuexiziyuan, "xuexiziyuan")); 
        return R.ok().put("data", xuexiziyuanService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(XuexiziyuanEntity xuexiziyuan){
        EntityWrapper< XuexiziyuanEntity> ew = new EntityWrapper< XuexiziyuanEntity>();
 		ew.allEq(MPUtil.allEQMapPre( xuexiziyuan, "xuexiziyuan")); 
		XuexiziyuanView xuexiziyuanView =  xuexiziyuanService.selectView(ew);
		return R.ok("查询学习资源成功").put("data", xuexiziyuanView);
    }
	
    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        XuexiziyuanEntity xuexiziyuan = xuexiziyuanService.selectById(id);
        if(null==xuexiziyuan.getClicknum()){
            xuexiziyuan.setClicknum(0);
        }
		xuexiziyuan.setClicknum(xuexiziyuan.getClicknum()+1);
		xuexiziyuanService.updateById(xuexiziyuan);
        xuexiziyuan = xuexiziyuanService.selectView(new EntityWrapper<XuexiziyuanEntity>().eq("id", id));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(xuexiziyuan,deSens);
        return R.ok().put("data", xuexiziyuan);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        XuexiziyuanEntity xuexiziyuan = xuexiziyuanService.selectById(id);
        if(null==xuexiziyuan.getClicknum()){
            xuexiziyuan.setClicknum(0);
        }
		xuexiziyuan.setClicknum(xuexiziyuan.getClicknum()+1);
		xuexiziyuanService.updateById(xuexiziyuan);
        xuexiziyuan = xuexiziyuanService.selectView(new EntityWrapper<XuexiziyuanEntity>().eq("id", id));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(xuexiziyuan,deSens);
        return R.ok().put("data", xuexiziyuan);
    }
    


    /**
     * 赞或踩
     */
    @RequestMapping("/thumbsup/{id}")
    public R vote(@PathVariable("id") String id,String type){
        XuexiziyuanEntity xuexiziyuan = xuexiziyuanService.selectById(id);
        if(type.equals("1")) {
        	xuexiziyuan.setThumbsupnum(xuexiziyuan.getThumbsupnum()+1);
        } else {
        	xuexiziyuan.setCrazilynum(xuexiziyuan.getCrazilynum()+1);
        }
        xuexiziyuanService.updateById(xuexiziyuan);
        return R.ok("投票成功");
    }

    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody XuexiziyuanEntity xuexiziyuan, HttpServletRequest request){
        //ValidatorUtils.validateEntity(xuexiziyuan);
        xuexiziyuanService.insert(xuexiziyuan);
        return R.ok().put("data",xuexiziyuan.getId());
    }
    
    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody XuexiziyuanEntity xuexiziyuan, HttpServletRequest request){
        //ValidatorUtils.validateEntity(xuexiziyuan);
        xuexiziyuanService.insert(xuexiziyuan);
        return R.ok().put("data",xuexiziyuan.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody XuexiziyuanEntity xuexiziyuan, HttpServletRequest request){
        //ValidatorUtils.validateEntity(xuexiziyuan);
        //全部更新
        xuexiziyuanService.updateById(xuexiziyuan);
        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        xuexiziyuanService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	/**
     * 前台智能排序
     */
	@IgnoreAuth
    @RequestMapping("/autoSort")
    public R autoSort(@RequestParam Map<String, Object> params,XuexiziyuanEntity xuexiziyuan, HttpServletRequest request,String pre){
        EntityWrapper<XuexiziyuanEntity> ew = new EntityWrapper<XuexiziyuanEntity>();
        Map<String, Object> newMap = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
        // 组装参数
		Iterator<Map.Entry<String, Object>> it = param.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, Object> entry = it.next();
			String key = entry.getKey();
			String newKey = entry.getKey();
			if (pre.endsWith(".")) {
				newMap.put(pre + newKey, entry.getValue());
			} else if (StringUtils.isEmpty(pre)) {
				newMap.put(newKey, entry.getValue());
			} else {
				newMap.put(pre + "." + newKey, entry.getValue());
			}
		}
		params.put("sort", "clicknum");
        params.put("order", "desc");

		PageUtils page = xuexiziyuanService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, xuexiziyuan), params), params));
        return R.ok().put("data", page);
    }


    /**
     * 协同算法（基于用户收藏的协同算法）
     */
    @RequestMapping("/autoSort2")
    public R autoSort2(@RequestParam Map<String, Object> params,XuexiziyuanEntity xuexiziyuan, HttpServletRequest request){
        String userId = request.getSession().getAttribute("userId").toString();
        Integer limit = params.get("limit")==null?10:Integer.parseInt(params.get("limit").toString());
        List<StoreupEntity> storeups = storeupService.selectList(new EntityWrapper<StoreupEntity>().eq("type", 1).eq("tablename", "xuexiziyuan"));
        Map<String, Map<String, Double>> ratings = new HashMap<>();
        if(storeups!=null && storeups.size()>0) {
            for(StoreupEntity storeup : storeups) {
                Map<String, Double> userRatings = null;
                if(ratings.containsKey(storeup.getUserid().toString())) {
                    userRatings = ratings.get(storeup.getUserid().toString());
                } else {
                    userRatings = new HashMap<>();
                    ratings.put(storeup.getUserid().toString(), userRatings);
                }

                if(userRatings.containsKey(storeup.getRefid().toString())) {
                    userRatings.put(storeup.getRefid().toString(), userRatings.get(storeup.getRefid().toString())+1.0);
                } else {
                    userRatings.put(storeup.getRefid().toString(), 1.0);
                }
            }
        }
        // 创建协同过滤对象
        UserBasedCollaborativeFiltering filter = new UserBasedCollaborativeFiltering(ratings);

        // 为指定用户推荐物品
        String targetUser = userId;
        int numRecommendations = limit;
        List<String> recommendations = filter.recommendItems(targetUser, numRecommendations);

        // 输出推荐结果
        System.out.println("Recommendations for " + targetUser + ":");
        for (String item : recommendations) {
            System.out.println(item);
        }

        EntityWrapper<XuexiziyuanEntity> ew = new EntityWrapper<XuexiziyuanEntity>();
        ew.in("id", String.join(",", recommendations));
        if(recommendations!=null && recommendations.size()>0 && recommendations.size()>0) {
            ew.last("order by FIELD(id, "+"'"+String.join("','", recommendations)+"'"+")");
        }

        // 根据协同结果查询结果并返回
        PageUtils page = xuexiziyuanService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, xuexiziyuan), params), params));;
        List<XuexiziyuanEntity> pageList = (List<XuexiziyuanEntity>)page.getList();
        if(recommendations!=null && recommendations.size()>0 && pageList.size()<limit) {
            int toAddNum = limit-pageList.size();
            ew = new EntityWrapper<XuexiziyuanEntity>();
            ew.notIn("id", recommendations);
            ew.orderBy("id", false);
            ew.last("limit "+toAddNum);
            pageList.addAll(xuexiziyuanService.selectList(ew));
        } else if(pageList.size()>limit) {
            pageList = pageList.subList(0, limit);
        }
        page.setList(pageList);

        return R.ok().put("data", page);
    }






}
