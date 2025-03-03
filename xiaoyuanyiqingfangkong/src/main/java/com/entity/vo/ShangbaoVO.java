package com.entity.vo;

import com.entity.ShangbaoEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 健康表
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 */
@TableName("shangbao")
public class ShangbaoVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

    @TableField(value = "id")
    private Integer id;


    /**
     * 上报学生
     */

    @TableField(value = "yonghu_id")
    private Integer yonghuId;


    /**
     * 健康状态
     */

    @TableField(value = "shangbao_types")
    private Integer shangbaoTypes;


    /**
     * 体温
     */

    @TableField(value = "shangbao_tiwen")
    private Double shangbaoTiwen;


    /**
     * 详情
     */

    @TableField(value = "shangbao_text")
    private String shangbaoText;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "insert_time")
    private Date insertTime;


    /**
     * 创建时间 show1 show2 photoShow
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "create_time")
    private Date createTime;


    /**
	 * 设置：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 获取：主键
	 */

    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 设置：上报学生
	 */
    public Integer getYonghuId() {
        return yonghuId;
    }


    /**
	 * 获取：上报学生
	 */

    public void setYonghuId(Integer yonghuId) {
        this.yonghuId = yonghuId;
    }
    /**
	 * 设置：健康状态
	 */
    public Integer getShangbaoTypes() {
        return shangbaoTypes;
    }


    /**
	 * 获取：健康状态
	 */

    public void setShangbaoTypes(Integer shangbaoTypes) {
        this.shangbaoTypes = shangbaoTypes;
    }
    /**
	 * 设置：体温
	 */
    public Double getShangbaoTiwen() {
        return shangbaoTiwen;
    }


    /**
	 * 获取：体温
	 */

    public void setShangbaoTiwen(Double shangbaoTiwen) {
        this.shangbaoTiwen = shangbaoTiwen;
    }
    /**
	 * 设置：详情
	 */
    public String getShangbaoText() {
        return shangbaoText;
    }


    /**
	 * 获取：详情
	 */

    public void setShangbaoText(String shangbaoText) {
        this.shangbaoText = shangbaoText;
    }
    /**
	 * 设置：创建时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }


    /**
	 * 获取：创建时间
	 */

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 设置：创建时间 show1 show2 photoShow
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 获取：创建时间 show1 show2 photoShow
	 */

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}
