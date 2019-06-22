package com.jiangxinsoft.scorpio.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	
	/**
	 * 获取当前系统年份
	 * @return
	 */
	public static int getCurrentYear() {
		Calendar calendar = Calendar.getInstance();
		return calendar.get(Calendar.YEAR);
	}
	
	/**
	 * 获取当月第一天
	 * @return
	 */
	public static Date getFirstDayOfMonth() {
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.MONTH, 0);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		
		return calendar.getTime();
	}
	
	/**
	 * 获取指定日期所在月份的第一天
	 * @param date
	 * @return
	 */
	public static Date getFirstDayOfMonth(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		
		calendar.add(Calendar.MONTH, 0);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		
		return calendar.getTime();
	}
	
	/**
	 * 获取当月最后一天
	 * @return
	 */
	public static Date getLastDayOfMonth() {
		Calendar calendar = Calendar.getInstance();
		
		calendar.add(Calendar.MONTH, 0);
		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		
		return calendar.getTime();
	}
	
	/**
	 * 获取指定日期所在月份的最后一天
	 * @return
	 */
	public static Date getLastDayOfMonth(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, 0);
		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		
		return calendar.getTime();
	}
	
	/**
	 * 比较两个日期
	 * @param dateA
	 * @param dateB
	 * @return
	 */
	public static int differDays(Date dateA, Date dateB) {
		Calendar calendarA = Calendar.getInstance();
		Calendar calendarB = Calendar.getInstance();
		
		calendarA.setTime(dateA);
		calendarB.setTime(dateB);
		
		return (calendarA.get(Calendar.DAY_OF_YEAR) - calendarB.get(Calendar.DAY_OF_YEAR));
	}
	
	/**
	 * 比较两个时间
	 * @param dateA
	 * @param dateB
	 */
	public static long differ(Date dateA, Date dateB) {
		Calendar calendarA = Calendar.getInstance();
		Calendar calendarB = Calendar.getInstance();
		
		calendarA.setTime(dateA);
		calendarB.setTime(dateB);
		
		calendarA.set(1970, 1, 1);
		calendarB.set(1970, 1, 1);
		
		return (calendarA.getTimeInMillis() - calendarB.getTimeInMillis());
	}
	
	/**
	 * 获取当天指定时间点的日期
	 * @param strTimestamp
	 * @return
	 */
	public static Date getTodayTimestamp(String strTimestamp) {
		Calendar calendar = Calendar.getInstance();
		
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH);
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		Date date = new Date();
		try {
			date = dateFormat.parse(strTimestamp);
			calendar.setTime(date);
			calendar.set(year, month, day);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return calendar.getTime();
	}
	
	public static String dateFormat(Date date, String stringFormat) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(stringFormat);
		return dateFormat.format(date);
	}
	
	public static Date dateFormat(String dateString, String stringFormat) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(stringFormat);
		try {
			return dateFormat.parse(dateString);
		} catch (ParseException e) {
		}
		return null;
	}
	
	/**
	 * 计算两个日期间的天数
	 * @param fromDate
	 * @param toDate
	 * @return
	 */
	public static int getDays(Date fromDate, Date toDate) {
		long fromMillions = fromDate.getTime();
		long toMillions = toDate.getTime();
		
		if(toMillions >= fromMillions) {
			return (int)((toMillions - fromMillions) / (24 * 3600 * 1000 ));
		} else {
			return (int)((fromMillions - toMillions) / (24 * 3600 * 1000 ));
		}
	}
	
	/**
	 * 比较两个日期：返回相隔天数
	 * @param fromDate
	 * @param toDate
	 * @return
	 */
	public static int dayCompareTo(Date fromDate, Date toDate) {
		long fromMillions = fromDate.getTime();
		long toMillions = toDate.getTime();
		
		int day = 0;
		if(toMillions >= fromMillions) {
			day = (int)((toMillions - fromMillions) / (24 * 3600 * 1000 ));
		} else {
			day = (int)((fromMillions - toMillions) / (24 * 3600 * 1000 ));
			day = -1 * day;
		}
		
		return day;
	}
	
	public static void main(String[] args) throws ParseException {
		/*Calendar calendar = Calendar.getInstance();
		calendar.roll(Calendar.MONTH, -1);
		Date tDate = calendar.getTime();
		
		Date date = getLastDayOfMonth(tDate);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		System.err.println(dateFormat.format(tDate));
		System.err.println(dateFormat.format(date));*/
		
		/*
		Date date = getTodayTimestamp("09:00:00");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		System.err.println(dateFormat.format(date));*/
		
		long fromMillions = 1525881600000l;
		long toMillions = 1525881600000l;
		System.out.println((toMillions - fromMillions));
		
	}
	
}
