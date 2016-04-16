## 简易博客题目

demo: [http://115.159.211.55](http://115.159.211.55)

完成了题目中提出的要求，代码查看请按如下提示

1. Comment的创建在Post详情页面，通过ajax请求json，由js更新页面，代码见

  controllers/posts_controller.rb#show  
  controllers/comments_controller.rb#create  
  views/posts/show.html.erb  
  app/assets/javascripts/comments.coffee

2. 在Post列表页面，展示三个Comment，代码见
  
  controllers/posts_controller.rb#index  
  models/post.rb#top3_comments  
  views/posts/index.html.erb  

3. 展示三个Comment，可能导致的性能问题，每次都要查询各个Post的前三个Comment，解决办法：加上缓存

  在views/posts/index.html.erb中，给加载Comment的块加上Fragment缓存，如果没有新增Comment，则从缓存中加载，如果有则缓存失效，从数据库中读取

4. 为了能使Comment复用于Post和Article，使用了一对多多态关联，并且Comment的表单用局部模板抽离以便共用
  
  models/post.rb models/article.rb  
  models/comment.rb  
  views/comments/_form.html.erb  

5. 标签系统使用了多对多多态关联

  models/post.rb models/article.rb  
  models/tagging.rb  
  models/tag.rb  
  为了使同一个标签名不会再tags表中出现两次，首先表中name字段为uniqe index，另外在创建Post时，以name从tag表中获取，未找到则创建新的
  controllers/posts_controller.rb#create
  
6. 测试覆盖了模型和控制器
