package com.example.muslim

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetProvider

class MyHomeWidgetProvider : HomeWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences
    ) {
        for (widgetId in appWidgetIds) {
            val views = RemoteViews(context.packageName, R.layout.home_widget_layout)
            
            // Get prayer times from shared preferences
            val fajr = widgetData.getString("fajr", "--:--")
            val dhuhr = widgetData.getString("dhuhr", "--:--")
            val asr = widgetData.getString("asr", "--:--")
            val maghrib = widgetData.getString("maghrib", "--:--")
            val isha = widgetData.getString("Isha", "--:--")
            
            // Update prayer time TextViews
            views.setTextViewText(R.id.fajr_time, fajr)
            views.setTextViewText(R.id.dhuhr_time, dhuhr)
            views.setTextViewText(R.id.asr_time, asr)
            views.setTextViewText(R.id.maghrib_time, maghrib)
            views.setTextViewText(R.id.Isha_time, isha)
            
            // Set click intent to open the app
            val intent = Intent(context, MainActivity::class.java)
            val pendingIntent = PendingIntent.getActivity(
                context, 0, intent, PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            views.setOnClickPendingIntent(R.id.widget_container, pendingIntent)
            
            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}