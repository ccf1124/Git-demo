package com.duing.util;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class GeneratorUtil {
    public static void main(String[] args) throws Exception {
//        执行过程中的告警信息
        List<String> warnings = new ArrayList<String>();
//        当生成的代码重复时  是否覆盖
        boolean overwrite = true;
        // A  ssm-duing-buyTicket 根路径
        // B  ssm-duing-buyTicket/../resources
        // C  ssm-duing-buyTicket/../java/com.duing.util
        // D  ssm-duing-buyTicket/../webapp

        File configFile = new File("mybatis/generatorConfig.xml");//根路径
//            if (!configFile.exists()) {
//                System.out.println("文件不存在");
//            }

        ConfigurationParser cp = new ConfigurationParser(warnings);
        Configuration config = cp.parseConfiguration(configFile);
        DefaultShellCallback callback = new DefaultShellCallback(overwrite);
        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
        myBatisGenerator.generate(null);

        for (String warning : warnings) {
            System.out.println(warning);
        }
    }
}
