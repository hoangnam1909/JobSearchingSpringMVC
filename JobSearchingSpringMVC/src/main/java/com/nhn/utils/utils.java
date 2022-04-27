package com.nhn.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class utils {
    public static Date stringToDate(String strDate, String pattern) throws ParseException {
        return new SimpleDateFormat(pattern).parse(strDate);
    }
}
