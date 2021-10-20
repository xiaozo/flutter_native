


# 事件


## 刷新

* event: refresh
* 示例：刷新每日练习页面
  
    PageEventChannel.PageEventApi(engine.dartExecutor.binaryMessenger)
                .postEvent(PageEventChannel.FEvent().apply {
                    event = "refresh"
                    // 当前页面的唯一ID
                    uniqueId = intent?.extras?.getString(EXTRA_UNIQUE_ID) ?: ""
                    params = mapOf()
                }) {}
  
    