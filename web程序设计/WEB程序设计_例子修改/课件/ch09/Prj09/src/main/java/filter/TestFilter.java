package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class TestFilter implements Filter {
	public TestFilter(){
		System.out.println("过滤器构造函数");
	}
	public void init(FilterConfig config) throws ServletException {
		System.out.println("过滤器初始化函数");
	}
	public void destroy() {
		System.out.println("过滤器消亡函数");
	}
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		System.out.println("过滤器doFilter函数");
		chain.doFilter(request, response);
	}
}
