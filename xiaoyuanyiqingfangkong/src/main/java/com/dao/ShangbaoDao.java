package com.dao;

import com.entity.ShangbaoEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.ShangbaoView;

/**
 * 健康表 Dao 接口
 *
 * @author 
 */
public interface ShangbaoDao extends BaseMapper<ShangbaoEntity> {

   List<ShangbaoView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
