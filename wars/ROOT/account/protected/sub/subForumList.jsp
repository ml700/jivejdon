<%@ taglib uri="struts-logic" prefix="logic" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="/WEB-INF/MultiPages.tld" prefix="MultiPages" %>
<%@ page contentType="text/html; charset=UTF-8" %>


<bean:parameter id="noheader" name="noheader"  value=""/>
<logic:notEqual name="noheader" value="on">
  <%@ include file="../../../blog/header.jsp" %>
  
   <div class="mainarea_right"> 
      <div class="box_mode_2"> 
      	   <div class="title"> 
		    <div class="title_left">我关注的道场</div> 		   
		 </div> 
		 <div class="content"> 
</logic:notEqual>

<%@ include file="../../../common/security.jsp" %>
<%@ include file="../../../common/loginAccount.jsp" %>
<logic:present name="loginAccount" >
  <%
  com.jdon.jivejdon.model.Account account = (com.jdon.jivejdon.model.Account)request.getAttribute("loginAccount");
  String userId = request.getParameter("userId");
  if ( account.getUserId().equals(userId)){
	  request.setAttribute("isOwner", "true"); 
  }
  %>
  
</logic:present>

<form action="" method="POST" name="listForm0" >
<input type="hidden" name="subscribeType" value="0">

<table class="contacts" width="600" cellpadding=3 cellspacing=0 border=1  align="center">
  <tr  bgcolor="#C3C3C3">
              <td class="contactDept" align="center" width="2">
                        选择
			</td>
			<td class="contactDept" align="center">
				道场标题
			</td>
			<td class="contactDept" align="center">
			     消息
			</td>
			<td class="contactDept" align="center" >
				邮件
			</td>
			
			<td class="contactDept" align="center" >
				新浪微博
			</td>
			
			<td class="contactDept" align="center" >
				腾讯微博
			</td>
			
			
		</tr>
		<logic:iterate id="subscription" name="subscriptionListForm" property="list"
			indexId="i">
			<bean:define id="subscribed" name="subscription" property="subscribed"></bean:define>
			<html:hidden name="subscribed" property="subscribeId" />
			<tr bgcolor="#ffffff">
			    <td class="contact" align="center" >
				<logic:present name="isOwner" >
				 <input type="radio" name="subscriptionId" value="<bean:write name="subscription" property="subscriptionId" />" >
				 </logic:present>
				</td>
				
				<td class="contact"  >
					<a href="<%=request.getContextPath()%>/forum/<bean:write name="subscribed" property="subscribeId"/>" 
              target="_blank">
						<bean:write name="subscribed" property="name" />
					</a>
				</td>
				<td class="contact" align="center" >
				    <html:checkbox name="subscription" property="actionType(com.jdon.jivejdon.manager.subscription.action.ShortMsgAction)" disabled="true"/>
				</td>
				<td class="contact" align="center" >
				   <html:checkbox name="subscription" property="actionType(com.jdon.jivejdon.manager.subscription.action.EmailAction)" disabled="true"/>
				</td>
			
				<td class="contact" align="center" >
				   <html:checkbox name="subscription" property="actionType(com.jdon.jivejdon.manager.subscription.action.SinaWeiboAction)" disabled="true"/>
				</td>
				
				<td class="contact" align="center" >
				   <html:checkbox name="subscription" property="actionType(com.jdon.jivejdon.manager.subscription.action.TecentWeiboAction)" disabled="true"/>
				</td>
			
			</tr>
		</logic:iterate>
	</table>
	<bean:parameter id="userIdParam" name="userId"  value=""/>
	<table cellpadding="4" cellspacing="0" border="0" width="580px">
		<tr>
			<td width="562px">
				<MultiPages:pager actionFormName="subscriptionListForm"
					page="/account/protected/sub/subForumList.shtml" paramId="userId" paramName="userIdParam">
					<MultiPages:prev name="[Prev ]" />
					<MultiPages:index />
					<MultiPages:next name="[Next ]" />
				</MultiPages:pager>
			</td>
			
		</tr>
	</table>
	<center>
	<logic:present name="isOwner" >
	 <input type="submit" name="edit" value="编辑选择的关注" onclick="return editAction('listForm0','subscriptionId');" >
      <input type="submit" name="delete" value="删除选择的关注" onclick="return delAction('listForm0','subscriptionId');" >
 
     <br></br>
           加入新关注方法：点按道场首页的图标<img src="/images/user_add.gif" width="18" height="18" alt="关注本主题" border="0" />就可加入。   
      
      </logic:present>
   </center>
</form>   




<logic:notEqual name="noheader" value="on">
	 </div> 
</div> 
</div> 
  <%@ include file="../../../blog/footer.jsp" %>
</logic:notEqual>