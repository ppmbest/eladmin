package me.zhengjie;

import java.util.Arrays;

import me.zhengjie.utils.SpringContextHolder;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author Zheng Jie
 * @date 2018/11/15 9:20:19
 */
@EnableAsync
@SpringBootApplication
@EnableTransactionManagement
public class AppRun {

    private static final String SPRING_CONFIG_NAME_KEY = "--spring.config.name";
    private static final String DEFAULT_SPRING_CONFIG_PARAM = SPRING_CONFIG_NAME_KEY + "=" + "application";

    public static void main(String[] args) {
        SpringApplication.run(AppRun.class, updateArguments(args));
    }

    @Bean
    public SpringContextHolder springContextHolder() {
        return new SpringContextHolder();
    }


    private static String[] updateArguments(String[] args) {
        if (Arrays.stream(args).noneMatch(arg -> arg.startsWith(SPRING_CONFIG_NAME_KEY))) {
            String[] modifiedArgs = new String[args.length + 1];
            System.arraycopy(args, 0, modifiedArgs, 0, args.length);
            modifiedArgs[args.length] = DEFAULT_SPRING_CONFIG_PARAM;
            return modifiedArgs;
        }
        return args;
    }
}
