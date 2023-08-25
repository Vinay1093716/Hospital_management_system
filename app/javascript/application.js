// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require jquery3
//= require popper
//= require bootstrap
//= require bootstrap-datepicker
<script type="text/javascript">
  $(function () {
    $('#dtpickerdemo').datetimepicker()
    });
</script> 
