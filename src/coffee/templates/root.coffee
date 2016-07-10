App.templates.root = _.template('\
	<nav class="navbar navbar-inverse navbar-fixed-top">\
    <div class="container">\
      <div class="navbar-header">
        <a href="#" class="navbar-brand">
          Dashboard\
        </a>\
        <span class="navbar-brand page-title" id="page_title"></span>\
      </div>\
    </div>\
  </nav>\
	<div class="container">
    <div id="content" class="main anim-loading anim-active"></div>\
  </div>\
  <footer>
    <div class="container">
      <p>2016 &copy; Company, Inc.</p>
    </div>
  </footer>\
')