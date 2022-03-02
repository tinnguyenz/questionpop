@saveSettings = (el, shop_domain) ->
  data = 'shop_domain': shop_domain
  url = base_url + '/settings'
  ShopifyApp.Bar.loadingOn()

  return
