<@p.header title="商家中心-仓库中的商品"/>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/ajaxfileupload/ajaxfileupload.js"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js"></script>
<div class="layout">
  <div class="sidebar">
    
  </div>
  <div class="right-content">
    <div class="path">
        <div><a href="${base}">商家中心</a><span>></span>
                             待审核的商品             
        </div>
    </div>
    <div class="main">
      
	<!-- ajax编辑商品名称样式 -->
	<style type="text/css">
		.ajax-edit:hover { background-color: #FFF9D4; color:#F30 !important;}
		.goods-name textarea { font-family: Tahoma; height: 16px; line-height: 16px; height: 32px !important; background-color:#F9F9F9; padding: 1px 2px 3px 4px !important; padding: 3px 2px 1px 4px; border: solid 1px; border-color: #CCC #DDD #DDD #CCC; box-shadow: 2px 2px 1px 0 #E7E7E7 inset; -moz-box-shadow: 2px 2px 1px 0 #E7E7E7 inset/* if FF*/; -webkit--box-shadow: 2px 2px 1px 0 #E7E7E7 inset/* if Webkie*/;}
		.goods-name textarea:hover { background-color:#FFF;}
		.goods-name textarea:focus { background-color:#FFF; border-color: #CCC; box-shadow: 1px 1px 1px 0 #E7E7E7; -moz-box-shadow: 1px 1px 1px 0 #E7E7E7/* if FF*/; -webkit--box-shadow: 1px 1px 1px 0 #E7E7E7/* if Webkie*/;}
	</style>
<div class="wrap">
<div class="tabmenu">
  <ul class="tab pngFix">
	 <!--  <li class="normal">
	      <a  href="${base}/pro/store">仓库中的商品</a>
	  </li> -->
	  <li class="active">
	      <a  href="javascript:void(0);">待审核的商品</a>
	  </li>
  </ul>
</div>
<table class="search-form">
  <form method="get" action="${base}/pro/preApply" name="queryListForm">
      <input type="hidden" name="storeClassId" value="${storeClassId}"/>
      <input type="hidden" name="goodsName" value="${goodsName}"/>
    <tr>
	      <td>&nbsp;</td>
	      <th>本店分类：</th>
	      <td class="w160">
	         <select name="newStoreClassId" class="w150">
	            <option value="">请选择</option>
	            <#if StoreGoodsClassVoMap??>
		            <#list StoreGoodsClassVoMap?keys as sgckey>
		            	<#list StoreGoodsClassVoMap[sgckey] as sgclist>
		            		<#if sgclist_index==0>
		            			<option value="${sgclist.parentId}">${sgclist.parentName}</option>
		            		<#else>
		            			<option value="${sgclist.childId}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sgclist.childName}</option>
		            		</#if>
		            	</#list>
		            </#list>
	            </#if>
	         </select>
	      </td>
	      <th>商品名称：</th>
	      <td class="w160"><input type="text" class="text" name="newGoodsName" value="${goodsName}"/></td>
	      <td class="w90 tc"><input type="submit" class="submit" value="搜索" name="search"/></td>
    </tr>
  </form>
</table>
  <table id="my_goods" server="" class="ncu-table-style">
    <thead>
      <tr nc_type="table_header">
        <th class="w30"></th>
        <th class="w70"></th>
        <th coltype="editable" column="goods_name" checker="check_required" inputwidth="230px">商品名称</th>
        <!-- <th class="w180" coltype="switchable" column="goods_show" onclass="right_ico" offclass="wrong_ico">上架</th> -->
        <th  class="w100" coltype="editable" column="goods_store_price" checker="check_number" inputwidth="50px">价格</th>
        <th class="w100" coltype="editable" column="spec_goods_storage" checker="check_pint" inputwidth="50px">库存</th>
        <th class="w90">操作</th>
      </tr>
      <tr>
        <td class="tc"><input type="checkbox" id="all" class="checkall"/></td>
        <td colspan="10"><label for="all">全选</label>
          <a href="javascript:void(0);" class="ncu-btn1" onClick="deleteBatchGoods();"><span>删除</span></a>
          <!-- <a href="javascript:void(0);" class="ncu-btn1" onClick="upBatchGoods();"><span>上架</span></a> -->
      </tr>
    </thead>
      <tbody>
         <#if goodsList??>
    	 	<#list goodsList as gl>
			    <tr>
			        <th class="tc"><input type="checkbox" class="checkitem tc" name="goods" value="${gl.goodsId}"/></th>
			        <th colspan="20">商品货号：${gl.goodsSerial}</th>
			    </tr>
			    <tr nc_type="table_item" idvalue="84">
			        <td></td>
			        <td class="w70">
				        <div class="goods-pic-small">
					        <span class="thumb size60"><i></i>
						        <a href="${frontServer}/product/detail?id=${gl.goodsId}" target="_blank">
						        	<img src="${imgServer}${gl.goodsImage}" onload="javascript:DrawImage(this,60,60);" />
						        </a>
					        </span>
				        </div>
			        </td>
			        <td>
				        <dl class="goods-name">
					        <dt nc_type="editobj" inputtype="textarea" style="color:#0579C6">
					        	${gl.goodsName}
					        </dt>
				        	<dd>${gl.gcName}</dd>
				        </dl>
			        </td>
	                <!-- <td>
		                <a href="javascript:void(0)" onclick="upGoods('${gl.goodsId}');" class="ncu-btn2">
		                	上架
		                </a>
	                </td> -->
	                <td>
		                <span class="" nctype="prict_selector" nc_gid="84">
		                	${gl.goodsStorePrice}
		                </span>
	                </td>
			        <td>
				        <span class="" nctype="stock_selector" nc_id="84">
				        	${gl.goodsTotalStorage}
				        </span>
			        </td>
			        <td>
			        	<!-- <p>
        	        		<a href="javascript:void(0);" onClick="combinationDialog('${gl.goodsId}','${gl.storeId}')">
					        	修改组合商品
					        </a>
			        	</p> -->
				        <p>
					        <!-- <a href="${base}/pro/editgoods?goodsId=${gl.goodsId}" target="_blank">
					        	编辑商品
					        </a> -->
					        待审核
				        </p>
				        <p>
					        <a href="javascript:void(0)" onclick="deleteGoods('${gl.goodsId}');" class="ncu-btn2 mt5">
					        	删&nbsp;除
					        </a>
				        </p>
			        </td>
			    </tr>
			</#list>
    	</#if>
      </tbody>
    <tfoot>
        <tr>
            <td colspan="20">
                <#import "/product/page.ftl" as q><!--引入分页-->
                <#if recordCount??>
                    <@q.pager pageNo=pageNo pageSize=pageSize recordCount=recordCount toURL="${toUrl}"/>
                </#if>
            </td>
        </tr>
   </tfoot>
      </table>
</div>

<script type="text/javascript" src="${base}/res/js/dialog.js" id="dialog_js" charset="utf-8"></script> 
  </div>
  </div>
  <div class="clear"></div>
</div>
<script type="text/javascript">
$(function(){
	//初始化
	init();
	//搜索
	$("[name=search]").click(function(){
		var storeClassId = $("[name=newStoreClassId] option:selected").val();
		$("[name=storeClassId]").attr("value",storeClassId);
		$("[name=goodsName]").attr("value",$("[name=newGoodsName]").val());
	});
});

/*
 * 初始化
 */
function init(){
	//本店分类搜索初始化
	if($("[name=storeClassId]").val() != ""){
		var classid = $("[name=storeClassId]").val();
		$("[name=newStoreClassId] option[value="+classid+"]").attr("selected","selected");
	}

}

/**
 * 删除
 */
 function deleteGoods(goodsIds){
	if(confirm("您确认要删除商品吗?")){
		var url = '${base}/pro/deleteGoods'
			var args = {"goodsIds" : goodsIds};
			$.post(url, args, function(data){
				//成功
				if(data.success){
					alert("删除成功!");
					location.reload([true]);
				}else{//失败
					alert("删除失败!");
				}
			});
	}
 }
 
 /*
  * 批量删除
  */
  function deleteBatchGoods(){
	 var goodsIds = ""
	 $("[name=goods]:checked").each(function(){
		 goodsIds += $(this).val() + ",";
	 });
	 if(goodsIds != ''){
		 goodsIds = goodsIds.substring(0,goodsIds.length-1);
		 deleteGoods(goodsIds);
	 }else{
		 alert("请至少选择一个商品进行删除");
	 }
 }
  
  
	// 收缩展开效果
	$(document).ready(function() {
		$(".sidebar dl dt").click(function() {
			$(this).toggleClass("hou");
			var sidebar_id = $(this).attr("id");
			var sidebar_dd = $(this).next("dd");
			sidebar_dd.slideToggle("slow", function() {
				$.cookie(COOKIE_PRE + sidebar_id, sidebar_dd.css("display"), {
					expires : 7,
					path : '/'
				});
			});
		});
	});
</script>
</body>
</html>
<@p.footer/>