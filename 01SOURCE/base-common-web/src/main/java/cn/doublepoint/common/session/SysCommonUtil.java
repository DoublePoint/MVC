package cn.doublepoint.common.session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import cn.doublepoint.common.constant.XTConstant;
import cn.doublepoint.dto.domain.model.entity.sys.SysUser;

public final class SysCommonUtil {

    private static HttpSession getSession() {
        HttpSession session = null;
        try {
            session = getRequest().getSession();
        } catch (Exception e) {
        }
        return session;
    }

    public static HttpServletRequest getRequest() {
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return attrs.getRequest();
    }

    /**
     * 从session中获取用户
     * 
     * @param session
     * @return user
     */
    public static SysUser getUser() {
        return (SysUser) getSession().getAttribute(XTConstant.SESSION_USER);
    }

    public static void setUser(SysUser user) {
        getSession().setAttribute(XTConstant.SESSION_USER, user);
    }

    public static void removeUser() {
        HttpSession session = getSession();
        session.removeAttribute(XTConstant.SESSION_USER);
        session.invalidate();
    }

    public static String getDefaultRecordString(Object obj,String defaultVal){
    	return (String)(obj!=null?obj.toString():defaultVal);
    }
    
    public static Long getDefaultRecordLong(Object obj,Long defaultVal){
    	if(obj!=null)
    		return Long.valueOf(obj.toString());
    	return defaultVal;
    }
    
    public static Integer getDefaultRecordInteger(Object obj,Integer defaultVal){
    	if(obj!=null)
    		return Integer.valueOf(obj.toString());
    	return defaultVal;
    }
    
    public static Object getCurrentUser(){
		return SecurityContextHolder.getContext().getAuthentication().getPrincipal() ;
    }
}