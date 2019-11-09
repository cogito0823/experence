package filter;

import javax.servlet.*;
import java.io.IOException;

/**
 * @Author: Chen Huahao
 * @Dscription:
 * @Date: Created in 11:27 2018/10/31
 */
public class EncodingFilter implements Filter {

    @Override
    public void destroy() {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig config) throws ServletException {}
}