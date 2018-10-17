package cn.doublepoint.commonutil.argumentresolver;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;

import org.omg.CORBA.Request;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.alibaba.fastjson.JSONObject;

import cn.doublepoint.commonutil.ajaxmodel.AjaxRequest;
import cn.doublepoint.commonutil.annotation.RequestForm;

public class AjaxRequestArgumentsResolver implements HandlerMethodArgumentResolver {
    /**
     * 解析器是否支持当前参数
     */
    @Override
    public boolean supportsParameter(MethodParameter parameter) {
    	return parameter.hasParameterAnnotation(RequestForm.class);
    }

    /**
     * 将request中的请求参数解析到当前Controller参数上
     * @param parameter 需要被解析的Controller参数，此参数必须首先传给{@link #supportsParameter}并返回true
     * @param mavContainer 当前request的ModelAndViewContainer
     * @param webRequest 当前request
     * @param binderFactory 生成{@link WebDataBinder}实例的工厂
     * @return 解析后的Controller参数
     */
    @Override
    public AjaxRequest resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
                                  NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
    	String _hiddenRequestData=webRequest.getParameter("_hiddenRequestData");
    	AjaxRequest request=JSONObject.parseObject(_hiddenRequestData, AjaxRequest.class);
    	return request;
    }
}