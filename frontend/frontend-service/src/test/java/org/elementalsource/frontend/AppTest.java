package org.elementalsource.frontend;

import org.junit.jupiter.api.Test;
import static org.junit.Assert.assertEquals;

/**
 * Unit test for simple App.
 */
public class AppTest {

    @Test
    public void test(){
        assertEquals("Hello world", App.callHello());
    }
}
