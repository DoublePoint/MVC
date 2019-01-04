package cn.doublepoint.common.security;

import cn.doublepoint.common.port.adapter.template.persistence.sys.menu.MenuService;
import cn.doublepoint.common.port.adapter.template.persistence.sys.role.MenuRoleService;
import cn.doublepoint.dto.domain.model.entity.sys.SysMenu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Created by yangyibo on 17/1/19.
 */
@Service
public class MyInvocationSecurityMetadataSourceService  implements
        FilterInvocationSecurityMetadataSource {

	@Autowired
    private MenuRoleService menuRoleService;
	@Autowired
    private MenuService menuService;

    private HashMap<String, Collection<ConfigAttribute>> map =null;

    /**
     * 加载权限表中所有权限
     */
    public void loadResourceDefine(){
        map = new HashMap<>();
        
        
        List<SysMenu> permissions = menuService.findAll(null);
        for(SysMenu menu : permissions) {
            
            List<String> roles = menuRoleService.getRoleIdsByMenuLink(menu.getLink());
            List<ConfigAttribute> array = roles.stream().map(item->{
            	return new SecurityConfig(String.valueOf(item));
            }).collect(Collectors.toList());
            //此处只添加了用户的名字，其实还可以添加更多权限的信息，例如请求方法到ConfigAttribute的集合中去。此处添加的信息将会作为MyAccessDecisionManager类的decide的第三个参数。
            //用权限的getUrl() 作为map的key，用ConfigAttribute的集合作为 value，
            map.put(menu.getLink(), array);
        }

    }

    //此方法是为了判定用户请求的url 是否在权限表中，如果在权限表中，则返回给 decide 方法，用来判定用户是否有此权限。如果不在权限表中则放行。
    @Override
    public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
    	System.out.println("----------------------------MyInvocationSecurityMetadataSourceService");
        if(map ==null) loadResourceDefine();
        //object 中包含用户请求的request 信息
        HttpServletRequest request = ((FilterInvocation) object).getHttpRequest();
        String menuLink = request.getRequestURI();
        List<String> roles = menuRoleService.getRoleIdsByMenuLink(menuLink);
        Collection<ConfigAttribute> list =  roles.stream().map(item->{
        	return new SecurityConfig(String.valueOf(item));
        }).collect(Collectors.toList());
        System.out.println("----------------------------"+object.toString());
        return list;
//    	Collection<ConfigAttribute> co=new ArrayList<>();
//        co.add(new SecurityConfig("1"));
//        return co;
        
//        AntPathRequestMatcher matcher;
//        String resUrl;
//        for(Iterator<String> iter = map.keySet().iterator(); iter.hasNext(); ) {
//            resUrl = iter.next();
//            matcher = new AntPathRequestMatcher(resUrl);
//            if(matcher.matches(request)) {
//                return map.get(resUrl);
//            }
//        }
//        return null;
    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return true;
    }
}