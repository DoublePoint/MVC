package cn.doublepoint.common.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import cn.doublepoint.common.domain.model.viewmodel.sys.VOAdminRole;
import cn.doublepoint.common.port.adapter.template.persistence.sys.admin.AdminRoleService;
import cn.doublepoint.common.port.adapter.template.persistence.sys.admin.AdminService;
import cn.doublepoint.dto.domain.model.entity.sys.SysAdmin;
import cn.doublepoint.dto.domain.model.entity.sys.SysAdminRole;

@Service
public class CustomUserService implements UserDetailsService { //自定义UserDetailsService 接口

	@Autowired
	AdminService adminService;
	@Autowired
	AdminRoleService adminRoleService;

    public UserDetails loadUserByUsername(String username) {
        SysAdmin user = adminService.getByLoginAccountNo(username);
        if (user != null) {
        	
        	List<VOAdminRole> adminRoles = adminRoleService.findRolesByAdminId(user.getId(), null);
            List<GrantedAuthority> grantedAuthorities = new ArrayList <>();
            for (VOAdminRole permission : adminRoles) {
                if (permission != null && permission.getRoleId()!=null) {

                GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(permission.getRoleId().toString());
                //1：此处将权限信息添加到 GrantedAuthority 对象中，在后面进行全权限验证时会使用GrantedAuthority 对象。
                grantedAuthorities.add(grantedAuthority);
                }
            }
            return new User(user.getLoginAccountNo(), user.getLoginPassword(), grantedAuthorities);
        } else {
            throw new UsernameNotFoundException("admin: " + username + " do not exist!");
        }
    }

}