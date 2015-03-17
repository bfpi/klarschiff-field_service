class KS.Nav
  constructor: ->
    @bar = $('nav .nav')

  switchTo: (view, content) ->
    return unless view? && parent = KS.content()
    @bar.find('li').removeClass('active')
    if view == 'map'
      parent.hide()
      $('#ol-map').show()
    else
      $('#ol-map').hide()
      if content? && (div = KS.content(view))?
        div.replaceWith content
      else
        parent.append content

      parent.show().children("div.#{ view }").show().siblings().hide()
      @bar.find("a.#{ view }").parent('li').addClass 'active'

$ ->
  KS.nav = new KS.Nav
  KS.nav.bar.on 'click', 'a.layer-switcher', ->
    KS.layers.toggle()
