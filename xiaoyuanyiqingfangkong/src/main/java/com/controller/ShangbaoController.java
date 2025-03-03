
package com.controller;

import java.io.File;
import java.math.BigDecimal;
import java.net.URL;
import java.text.SimpleDateFormat;
import com.alibaba.fastjson.JSONObject;
import java.util.*;
import org.springframework.beans.BeanUtils;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.context.ContextLoader;
import javax.servlet.ServletContext;
import com.service.TokenService;
import com.utils.*;
import java.lang.reflect.InvocationTargetException;

import com.service.DictionaryService;
import org.apache.commons.lang3.StringUtils;
import com.annotation.IgnoreAuth;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.entity.*;
import com.entity.view.*;
import com.service.*;
import com.utils.PageUtils;
import com.utils.R;
import com.alibaba.fastjson.*;

/**
 * 健康表
 * 后端接口
 * @author
 * @email
*/
@RestController
@Controller
@RequestMapping("/shangbao")
public class ShangbaoController {
    private static final Logger logger = LoggerFactory.getLogger(ShangbaoController.class);

    @Autowired
    private ShangbaoService shangbaoService;


    @Autowired
    private TokenService tokenService;
    @Autowired
    private DictionaryService dictionaryService;

    //级联表service
    @Autowired
    private YonghuService yonghuService;

    @Autowired
    private JiaoshiService jiaoshiService;


    /**
    * 后端列表
    */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("page方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));
        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永不会进入");
        else if("学生".equals(role))
            params.put("yonghuId",request.getSession().getAttribute("userId"));
        else if("教师".equals(role))
            params.put("xueyuanTypes",jiaoshiService.selectById((Integer)request.getSession().getAttribute("userId")).getXueyuanTypes());
        if(params.get("orderBy")==null || params.get("orderBy")==""){
            params.put("orderBy","id");
        }
        PageUtils page = shangbaoService.queryPage(params);

        //字典表数据转换
        List<ShangbaoView> list =(List<ShangbaoView>)page.getList();
        for(ShangbaoView c:list){
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(c, request);
        }
        return R.ok().put("data", page);
    }

    /**
    * 后端详情
    */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("info方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        ShangbaoEntity shangbao = shangbaoService.selectById(id);
        if(shangbao !=null){
            //entity转view
            ShangbaoView view = new ShangbaoView();
            BeanUtils.copyProperties( shangbao , view );//把实体数据重构到view中

                //级联表
                YonghuEntity yonghu = yonghuService.selectById(shangbao.getYonghuId());
                if(yonghu != null){
                    BeanUtils.copyProperties( yonghu , view ,new String[]{ "id", "createTime", "insertTime", "updateTime"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setYonghuId(yonghu.getId());
                }
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(view, request);
            return R.ok().put("data", view);
        }else {
            return R.error(511,"查不到数据");
        }

    }

    /**
    * 后端保存
    */
    @RequestMapping("/save")
    public R save(@RequestBody ShangbaoEntity shangbao, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,shangbao:{}",this.getClass().getName(),shangbao.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永远不会进入");
        else if("学生".equals(role))
            shangbao.setYonghuId(Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId"))));

        Wrapper<ShangbaoEntity> queryWrapper = new EntityWrapper<ShangbaoEntity>()
            .eq("yonghu_id", shangbao.getYonghuId())
            .eq("shangbao_types", shangbao.getShangbaoTypes())
            .eq("shangbao_text", shangbao.getShangbaoText())
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        ShangbaoEntity shangbaoEntity = shangbaoService.selectOne(queryWrapper);
        if(shangbaoEntity==null){
            shangbao.setInsertTime(new Date());
            shangbao.setCreateTime(new Date());
            shangbaoService.insert(shangbao);
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody ShangbaoEntity shangbao, HttpServletRequest request){
        logger.debug("update方法:,,Controller:{},,shangbao:{}",this.getClass().getName(),shangbao.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
//        if(false)
//            return R.error(511,"永远不会进入");
//        else if("学生".equals(role))
//            shangbao.setYonghuId(Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId"))));
        //根据字段查询是否有相同数据
        Wrapper<ShangbaoEntity> queryWrapper = new EntityWrapper<ShangbaoEntity>()
            .notIn("id",shangbao.getId())
            .andNew()
            .eq("yonghu_id", shangbao.getYonghuId())
            .eq("shangbao_types", shangbao.getShangbaoTypes())
            .eq("shangbao_text", shangbao.getShangbaoText())
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        ShangbaoEntity shangbaoEntity = shangbaoService.selectOne(queryWrapper);
        if(shangbaoEntity==null){
            shangbaoService.updateById(shangbao);//根据id更新
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        shangbaoService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }


    /**
     * 批量上传
     */
    @RequestMapping("/batchInsert")
    public R save( String fileName){
        logger.debug("batchInsert方法:,,Controller:{},,fileName:{}",this.getClass().getName(),fileName);
        try {
            List<ShangbaoEntity> shangbaoList = new ArrayList<>();//上传的东西
            Map<String, List<String>> seachFields= new HashMap<>();//要查询的字段
            Date date = new Date();
            int lastIndexOf = fileName.lastIndexOf(".");
            if(lastIndexOf == -1){
                return R.error(511,"该文件没有后缀");
            }else{
                String suffix = fileName.substring(lastIndexOf);
                if(!".xls".equals(suffix)){
                    return R.error(511,"只支持后缀为xls的excel文件");
                }else{
                    URL resource = this.getClass().getClassLoader().getResource("static/upload/" + fileName);//获取文件路径
                    File file = new File(resource.getFile());
                    if(!file.exists()){
                        return R.error(511,"找不到上传文件，请联系管理员");
                    }else{
                        List<List<String>> dataList = PoiUtil.poiImport(file.getPath());//读取xls文件
                        dataList.remove(0);//删除第一行，因为第一行是提示
                        for(List<String> data:dataList){
                            //循环
                            ShangbaoEntity shangbaoEntity = new ShangbaoEntity();
//                            shangbaoEntity.setYonghuId(Integer.valueOf(data.get(0)));   //上报学生 要改的
//                            shangbaoEntity.setShangbaoTypes(Integer.valueOf(data.get(0)));   //健康状态 要改的
//                            shangbaoEntity.setShangbaoTiwen(data.get(0));                    //体温 要改的
//                            shangbaoEntity.setShangbaoText(data.get(0));                    //详情 要改的
//                            shangbaoEntity.setInsertTime(date);//时间
//                            shangbaoEntity.setCreateTime(date);//时间
                            shangbaoList.add(shangbaoEntity);


                            //把要查询是否重复的字段放入map中
                        }

                        //查询是否重复
                        shangbaoService.insertBatch(shangbaoList);
                        return R.ok();
                    }
                }
            }
        }catch (Exception e){
            return R.error(511,"批量插入数据异常，请联系管理员");
        }
    }






}
