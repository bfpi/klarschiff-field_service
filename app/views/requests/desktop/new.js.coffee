<% if params[:switch_bike_type] -%>
bike_type = "<%= @bike_type %>"
$('#bike_type').val(bike_type)
<% else -%>
<% if params[:switch_type] -%>
KS.layers.findById('new_feature').getSource().getFeatures()[0].setStyle(KS.styles.newFeature("<%= @type %>"))
$('#type-select').replaceWith("<%= j render partial: 'requests/desktop/category_select', locals: { type: @type, category: nil, service_code: nil } %>")
<% else -%>
<% if @errors.present? -%>
$('.errors').replaceWith("<%= j render partial: 'application/desktop/errors' %>")
<% else -%>
coord = null
if (layer = KS.layers.findById('new_feature')) && (features = layer.getSource().getFeatures()).length > 0
  coord = features[0].getGeometry().getCoordinates()
type = "<%= @request.type.presence || 'blank' %>"
KS.createFeature type, coord
$('.request-container').replaceWith("<%= j render partial: 'requests/desktop/new' %>")
<% end -%>
<% end -%>
<% end -%>
$('input[name ="commit"]').click ->
  $('textarea#request_description').val $('textarea#request_description').val() + '---bike_type:' + $('#bike_type').val()
  $('textarea#request_description').val $('textarea#request_description').val() + '---quantity:' + $('#quantity').val()
  return
