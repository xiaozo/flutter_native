# Flutter路由


## 跳转Flutter

### 每日练习

* 路径: /every_day_exercise
* 入参
  * lessonId: 课程ID 类型：String
  * taskClassify：数值：int
    * 值 1 - 课前预习
    * 值 2 - 课后复习


### 书写练习-录音界面

  Flutter控制关闭页面

* 路径：/exercise_record_page
* 入参：
    * galleryItems: 浏览图片数组 list<string>  
      * 如果没有传空数组
* 返回值:
    * audioPath 录音本地的地址  String

## 跳转原生


### 每日一练-课前/课后复习


  每日一练显示原生的作业页面

* 路径：/lesson_task
* 入参：
    * taskId: 任务ID String
    * taskGroupBy: 任务类型，Int
      * 1 在线练习
      * 2 绘本听读
      * 3 书写练习
      * 4 学习资源
  
    * complete: int
      * 1 已完成
      * 0 未完成
