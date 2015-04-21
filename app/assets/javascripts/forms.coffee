$ ->
  KS.content().on 'click', '.has-clear .form-control-clear', ->
    $(@).parents('.form-group').find('input').val ''

  KS.content().on 'change', 'select[data-update]', ->
    if (target = $("##{ $(@).data('update') }"))? && (url = target.data('src'))?
      $.ajax(url: url, dataType: 'json', data: category: $(@).val()).done (response) ->
        target.html('').append "<option disabled='disabled' selected='selected' class='placeholder'>#{
          target.data('placeholder') }</option>"
        $(response).each ->
          target.append "<option value='#{ @service_code }'>#{ @service_name }</option>"

  KS.content().on 'submit', 'form.fileupload', ->
    $(@).ajaxSubmit dataType: 'script'
    return false