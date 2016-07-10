App.templates.user.edit = _.template('\
  <form class="panel panel-default">
    <div class="panel-body">
      <form class="form-horizontal">
        <fieldset>
          <div class="row">
            <div class="col-sm-8">
              <legend>
                <%= name.split(" ")[0] %>
                "<%= username %>"
                <%= name.split(" ")[1] %>
              </legend>
            </div>
            <div class="col-sm-4 text-right">
              <button type="submit" class="btn btn-primary">Submit</button>
            </div>
          </div>
          <div class="form-group clearfix">
            <label for="email" class="col-sm-2 control-label">Email</label>
            <div class="col-sm-10">
              <input type="email" class="form-control" name="email" id="email" value="<%= email %>" placeholder="Email">
            </div>
          </div>
          <div class="form-group clearfix">
            <label for="website" class="col-sm-2 control-label">Website</label>
            <div class="col-sm-10">
              <input type="url" class="form-control" name="website" id="website" value="http://<%= website %>" placeholder="Website">
            </div>
          </div>
          <div class="form-group clearfix">
            <label for="phone" class="col-sm-2 control-label">Phone</label>
            <div class="col-sm-10">
              <span><%= phone %></span>
            </div>
          </div>
          <div class="form-group clearfix">
            <label for="address" class="col-sm-2 control-label">Address</label>
            <div class="col-sm-10">
              <div id="address"></div>
            </div>
          </div>
          <div class="form-group">
            <div class="col-md-10 col-md-offset-2">

            </div>
          </div>
        </fieldset>
      </form>
    </div>
  </div>
')