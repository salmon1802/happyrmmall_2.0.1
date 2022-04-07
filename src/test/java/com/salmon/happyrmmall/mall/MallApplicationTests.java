package com.salmon.happyrmmall.mall;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;

@SpringBootTest
class MallApplicationTests {

    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    @Test
    public void set(){
        redisTemplate.opsForValue().set("Key1","Value1");
    }

}
