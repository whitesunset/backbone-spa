App.templates.user.address = _.template('\
  <div class="address">
    <div><%= street %> str.</div>
    <div><%= suite %></div>
    <div><%= city %>, <%= zipcode %></div>
    <div class="iframe-container anim-loading anim-active">
      <iframe width="600"
              height="450"
              frameborder="0"
              style="border:0"
              src="https://www.google.com/maps/embed/v1/place?q=<%= geo.lat %>,<%= geo.lng %>&key=AIzaSyCbhZbGfsiYQheGX3Zq969LH54uv7ymjIw"
              allowfullscreen>
      </iframe>
    </div>
  </div>
')