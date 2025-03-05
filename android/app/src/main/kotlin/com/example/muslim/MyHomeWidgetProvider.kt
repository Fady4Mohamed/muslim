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
            // نفترض أن لديك ملف تصميم باسم widget_layout.xml في res/layout
            val views = RemoteViews(context.packageName, R.layout.widget_layout)
            
            // جلب النص المحفوظ من SharedPreferences
            val widgetText = widgetData.getString("widget_text", "Default Text")
            views.setTextViewText(R.id.widget_text, widgetText)
            
            // إنشاء Intent لفتح التطبيق عند الضغط على الودجت
            val intent = Intent(context, MainActivity::class.java)
            intent.action = AppWidgetManager.ACTION_APPWIDGET_UPDATE

            val pendingIntent = PendingIntent.getActivity(
                context,
                0,
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            
            // تعيين PendingIntent على العنصر الرئيسي في تصميم الودجت (يفضل أن يكون له معرف معين مثل R.id.widget_container)
            views.setOnClickPendingIntent(R.id.widget_container, pendingIntent)
            
            // تحديث الودجت
            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
