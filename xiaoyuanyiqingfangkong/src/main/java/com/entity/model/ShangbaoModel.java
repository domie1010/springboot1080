package com.entity.model;

import com.entity.ShangbaoEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 健康表
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 */
public class ShangbaoModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 上报学生
     */
    private Integer yonghuId;


    /**
     * 健康状态
     */
    private Integer shangbaoTypes;


    /**
     * 体温
     */
    private Double shangbaoTiwen;


    /**
     * 详情
     */
    private String shangbaoText;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date insertTime;


    /**
     * 创建时间 show1 show2 photoShow
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date createTime;


    /**
	 * 获取：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 设置：主键
	 */
    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 获取：上报学生
	 */
    public Integer getYonghuId() {
        return yonghuId;
    }


    /**
	 * 设置：上报学生
	 */
    public void setYonghuId(Integer yonghuId) {
        this.yonghuId = yonghuId;
    }
    /**
	 * 获取：健康状态
	 */
    public Integer getShangbaoTypes() {
        return shangbaoTypes;
    }


    /**
	 * 设置：健康状态
	 */
    public void setShangbaoTypes(Integer shangbaoTypes) {
        this.shangbaoTypes = shangbaoTypes;
    }
    /**
	 * 获取：体温
	 */
    public Double getShangbaoTiwen() {
        return shangbaoTiwen;
    }


    /**
	 * 设置：体温
	 */
    public void setShangbaoTiwen(Double shangbaoTiwen) {
        this.shangbaoTiwen = shangbaoTiwen;
    }
    /**
	 * 获取：详情
	 */
    public String getShangbaoText() {
        return shangbaoText;
    }


    /**
	 * 设置：详情
	 */
    public void setShangbaoText(String shangbaoText) {
        this.shangbaoText = shangbaoText;
    }
    /**
	 * 获取：创建时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }


    /**
	 * 设置：创建时间
	 */
    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 获取：创建时间 show1 show2 photoShow
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 设置：创建时间 show1 show2 photoShow
	 */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    }
