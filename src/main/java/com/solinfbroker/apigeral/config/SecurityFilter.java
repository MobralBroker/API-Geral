package com.solinfbroker.apigeral.config;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@Component
@RequiredArgsConstructor
public class SecurityFilter extends OncePerRequestFilter{

    @Value("${apiAutenticacao.path}")
    private String pathAutenticacao;

    private final RestTemplate restTemplate;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException{
        var token = this.recoveryToken(request);
        var tokenInvalido = "Token Inválido, refaça o login para liberar o acesso!";
        var utf = "UTF-8";
            if(token != null){
                try {
                    ResponseEntity<String> responseAuth = this.restTemplate.getForEntity(pathAutenticacao+"/auth/validar?token="+token, String.class);
                    if(responseAuth.getStatusCode().equals(HttpStatus.UNAUTHORIZED)){
                        response.setStatus(HttpServletResponse.SC_NOT_ACCEPTABLE);
                        response.setCharacterEncoding(utf);
                        response.getWriter().println(tokenInvalido);
                    }else{
                        filterChain.doFilter(request, response);
                    }
                }catch (Exception e){

                    response.setStatus(HttpServletResponse.SC_NOT_ACCEPTABLE);
                    response.setCharacterEncoding(utf);
                    response.getWriter().println(tokenInvalido);
                }
            }else{

                String requestURI = request.getRequestURI();
                // Checando se o request é um request do Swagger e permitindo acesso
                if(requestURI.startsWith("/swagger-ui/") ||
                   requestURI.startsWith("/v2/api-docs") ||
                   requestURI.startsWith("/swagger-resources") || 
                   requestURI.startsWith("/webjars/") ||
                   requestURI.startsWith("/api/v1/auth/**") ||
                   requestURI.startsWith("/v3/api-docs") ||
                   requestURI.startsWith("/v3/api-docs/index.html") ||
                   requestURI.startsWith("/v3/api-docs/swagger-config") ||
                   requestURI.startsWith("/v3/api-docs.yaml") ||
                   requestURI.startsWith("/swagger-ui/**") ||
                   requestURI.startsWith("/swagger-ui.html")
                   ) {
                    filterChain.doFilter(request, response);
                } else {
                    response.setStatus(HttpServletResponse.SC_NOT_ACCEPTABLE);
                    response.setCharacterEncoding(utf);
                    response.getWriter().println(tokenInvalido);
                }
                

            }


    }

    private String recoveryToken(HttpServletRequest request){
        var authHeader = request.getHeader("Authorization");
        if(authHeader== null) return null;
        return authHeader.replace("Bearer ","");
    }
    
}
