package org.jboss.roadshoweap;

import javax.enterprise.inject.Produces;
import javax.enterprise.inject.spi.InjectionPoint;

import org.jboss.logging.Logger;

public class Loggers {
	
	@Produces  
    public static Logger getLogger(InjectionPoint injectionPoint) {  
        return Logger.getLogger(injectionPoint.getMember().getDeclaringClass().getSimpleName());  
    }  
}
