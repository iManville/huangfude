<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<div class="row">
	<div class="col-md-12">
		<form role="form" id="templatemo-preferences-form">	
			<div class="row">
				<div class="col-md-6 margin-bottom-15">
                    <label for="name" class="control-label">名称</label>
                    <input type="text" class="form-control" id="name" name="name" value="${folder.name}">   
                    ${nameMsg}               
                </div>
             </div>


			  <div class="row templatemo-form-buttons">
                <div class="col-md-12">
                  <button type="button" onclick="submitForm()" class="btn btn-primary">确定</button>
                  <button type="reset" class="btn btn-default">重置</button>    
                </div>
              </div>
			  <input type="hidden" id="id" name="id" value="${folder.id}">
		</form>
	</div>
</div>
