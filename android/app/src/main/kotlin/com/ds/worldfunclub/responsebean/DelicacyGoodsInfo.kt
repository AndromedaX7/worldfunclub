package com.ds.worldfunclub.responsebean

class DelicacyGoodsInfo {

    var goods_sku_id: String = ""
    var goods_id: String = ""
    var spec_sku_id: String = ""
    var image_id: String = ""
    var goods_no: String = ""
    var goods_price: String = ""
    var line_price: String = ""
    var stock_num: String = ""
    var goods_sales: String = ""
    var goods_weight: String = ""
    var image: String = ""


    var item_id: String = ""
    var spec_value: String = ""

    var group_id = ""
    var group_name = ""

    var needSubScribe = false
    var needSubScribeDate = ""


    companion object {
        fun fromGoodsDetails(
            data: GoodsDetailsResp3.DataBean,
            sku: GoodsDetailsResp2.DataBean.SkuListBean,
            attr: GoodsDetailsResp2.DataBean.SpecAttrBean,
            item: GoodsDetailsResp2.DataBean.SpecAttrBean.SpecItemsBean
        ): DelicacyGoodsInfo {
            val target = DelicacyGoodsInfo()

            target.goods_id = sku.goods_id
            target.goods_sku_id = sku.goods_sku_id
            target.spec_sku_id = sku.spec_sku_id
            target.image_id = sku.image_id
            target.goods_no = sku.goods_no
            target.goods_price = sku.goods_price
            target.line_price = sku.line_price
            target.stock_num = sku.stock_num
            target.goods_sales = sku.goods_sales
            target.goods_weight = sku.goods_weight
            target.image = sku.image

            target.item_id = item.item_id
            target.spec_value = item.spec_value
            target.group_id = attr.group_id
            target.group_name = attr.group_name
            target.needSubScribe = data.subscribe == "20"
            target.needSubScribeDate = if (target.needSubScribe) {
//                "${
//                    data.lh_start_time.toLong().toDateString("yyyy-MM-dd HH:mm")
//                } - ${data.lh_start_time.toLong().toDateString("yyyy-MM-dd HH:mm")}  |  需要预约"
                "${data.shopInfo.shop_hours} | 需要预约"
            } else {
                "周一至周日  |  免预约"
            }
            return target
        }

        fun fromGoodsDetails(
            data: GoodsDetailsResp3.DataBean,
            sku: GoodsDetailsResp2.DataBean.SkuListBean,
        ): DelicacyGoodsInfo {
            val target = DelicacyGoodsInfo()

            target.goods_id = sku.goods_id
            target.goods_sku_id = sku.goods_sku_id
            target.spec_sku_id = sku.spec_sku_id
            target.image_id = sku.image_id
            target.goods_no = sku.goods_no
            target.goods_price = sku.goods_price
            target.line_price = sku.line_price
            target.stock_num = sku.stock_num
            target.goods_sales = sku.goods_sales
            target.goods_weight = sku.goods_weight
            target.image = sku.image

            target.item_id = sku.goods_id
            target.spec_value = data.goods_name
            target.group_id = data.goods_id
            target.group_name = data.selling_point
            target.needSubScribe = data.subscribe == "20"
            target.needSubScribeDate = if (target.needSubScribe) {
                "${data.shopInfo.shop_hours} | 需要预约"
//                "${
//                    data.lh_start_time.toLong().toDateString("yyyy-MM-dd")
//                }~${data.lh_start_time.toLong().toDateString("yyyy-MM-dd")}| 需要预约"
            } else {
                "周一至周日 | 免预约"
            }
            return target
        }
    }

}