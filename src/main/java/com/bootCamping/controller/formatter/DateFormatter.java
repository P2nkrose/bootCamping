package com.bootCamping.controller.formatter;

import org.springframework.format.Formatter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class DateFormatter implements Formatter<Date> {

    private SimpleDateFormat dateFormat;
    public DateFormatter(){
        this.dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        this.dateFormat.setLenient(false);
    }

    @Override
    public Date parse(String text, Locale locale) throws ParseException {
        String[] date = text.split("-");
        if(date.length!=3){
            throw new ParseException("잘못된입력입니다.",0);
        }
        int dateYear = Integer.parseInt(date[0]);
        int dateMonth = Integer.parseInt(date[1]);
        int dateDay = Integer.parseInt(date[2]);

        String dateStr = String.format("%04d-%02d-%02d",dateYear,dateMonth,dateDay);

        return dateFormat.parse(dateStr);
    }

    @Override
    public String print(Date object, Locale locale) {
        return dateFormat.format(object);
    }
}
