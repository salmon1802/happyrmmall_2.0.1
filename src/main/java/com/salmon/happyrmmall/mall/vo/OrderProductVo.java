package com.salmon.happyrmmall.mall.vo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 * 返回给订单确认页
 * @date 2020-12-6 - 16:15
 * Created by Salmon
 */
public class OrderProductVo implements Serializable {

    private List<OrderItemVo> orderItemVoList;

    private BigDecimal productTotalPrice;

    private String imageHost;

    private static final long serialVersionUID = 1L;

    public List<OrderItemVo> getOrderItemVoList() {
        return orderItemVoList;
    }

    public void setOrderItemVoList(List<OrderItemVo> orderItemVoList) {
        this.orderItemVoList = orderItemVoList;
    }

    public BigDecimal getProductTotalPrice() {
        return productTotalPrice;
    }

    public void setProductTotalPrice(BigDecimal productTotalPrice) {
        this.productTotalPrice = productTotalPrice;
    }

    public String getImageHost() {
        return imageHost;
    }

    public void setImageHost(String imageHost) {
        this.imageHost = imageHost;
    }
}
