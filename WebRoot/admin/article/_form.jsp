<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<div class="row">
	<div class="col-md-12">
		<form role="form" id="templatemo-preferences-form" method="post">	
			<div class="row">
				<div class="col-md-12 margin-bottom-15">
                    <label for="title" class="control-label">标题</label>
                    <input type="text" class="form-control" id="title" name="title" value="${article.title}">   
                    ${titleMsg}               
                </div>
             </div>
			 <div class="row">
                <div class="col-md-6 margin-bottom-15">
                  <label for="singleSelect">目录</label>
                  <select class="form-control margin-bottom-15" id="folder_id" name="folder_id">
                    <option value="1">技术</option>
                    <option value="2">真假</option>
                  </select>
                </div>
                <div class="col-md-6">
                  <div class="radio margin-bottom-15">
                    <label>
                      <input type="radio" name="status" value="1" <c:if test="${article.status==1||article.status==null}">checked</c:if>>
                      	显示
                    </label>
                  </div>
                  <div class="radio">
                    <label>
                      <input type="radio" name="status" value="2" <c:if test="${article.status==2}">checked</c:if>>
                      	隐藏
                    </label>
                  </div>               
                </div>                            
              </div> 
			 <div class="row">
                <div class="col-md-12 margin-bottom-15">
                  <label for="content">内容</label>
                  ${contentMsg}
                  <!-- 加载编辑器的容器 -->
		    	<script id="content" name="content" type="text/plain" style="height: 380px;">
					${article.content}
				</script>
		    	<script type="text/javascript">
			        var ue = UE.getEditor('content');
			    </script>
                </div>
              </div>
              <div class="row">
				<div class="col-md-12 margin-bottom-15">
                    <label for="title" class="control-label">标签</label>
                    <input type="text" class="form-control" id="tags" name="tags" value="${tags}">   
                </div>
             </div>
              <div class="row">
                <div class="col-md-12 margin-bottom-15">
                  <label class="radio-inline">
                    <input type="radio" name="type" value="1" <c:if test="${article.type==1||article.type==null}">checked</c:if>> 原创
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="type" value="2" <c:if test="${article.type==2}">checked</c:if>> 转载
                  </label>                 
                </div>                
              </div>

			  <div class="row templatemo-form-buttons">
                <div class="col-md-12">
                  <button type="button" onclick="submitForm()" class="btn btn-primary">确定</button>
                  <button type="reset" class="btn btn-default">重置</button>    
                </div>
              </div>
			  <input type="hidden" id="id" name="id" value="${article.id}">
		</form>
	</div>
</div>
